const { send, emitWarning } = require('process');

require('json');

const util = require('util')
const querystring = require("querystring");
const winston = require('winston');

// const logTargetIP = '10.1.1.9';
const logger = winston.createLogger({
    level: process.env.LOGLEVEL,
    format: winston.format.json(),
    defaultMeta: { service: 'user-service' },
    transports: [
        //
        // - Write all logs with importance level of `error` or less to `error.log`
        // - Write all logs with importance level of `info` or less to `combined.log`
        //
        //   new winston.transports.Console(),
        new winston.transports.File({ filename: 'error.log', level: 'error' }),
        new winston.transports.File({ filename: 'combined.log' }),
    ],    
});

const webServerIP = '127.0.0.1';
const webTargetIP = 'www-xc.mikelabs.online';
const webTargetPort = 80;
const webServerPort = process.env.WEBPORT;
const logServerPort = process.env.LOGGERPORT;
// var logIdx = 0;
var logEntries = [];
var vipTargets = [];

// Start a web server which will receive our requests
createWebServer();

// start the syslog server which will get the data from the iRule
startSyslog();

function startSyslog() {
    

    const net = require('net');
    const tls = require('tls');
    const fs = require('fs');
    const crypto = require("crypto");

    const tlsOptions = {
        key: fs.readFileSync('/etc/ssl/privateKey.key'),
        cert: fs.readFileSync('/etc/ssl/certificate.crt')
    };

    // load the VIP list
    const vipList = fs.readFileSync('viplist.csv', 'utf-8');
    vipList.split(/\r?\n/).forEach(line => {
        try {
            const lineData = line.split(",");
            const newVIP = {
                vip: lineData[0],
                target: lineData[1]
            }
            vipTargets.push(newVIP);
        } catch (error) {
            logger.error(`Error reading targets: ${error.message}`);
        }
    });
    logger.debug(util.inspect(vipTargets));
    
    const dataChunks = []; //[utf8Encode.encode('{ "request": { "headers":[], "payload":"", "method":"get", "uri" : "/" }, "response": { "headers": [], "payload": "" } }') ];

    const server = tls.createServer(tlsOptions, (socket) => {
        let utf8Encode = new TextEncoder();

        logger.verbose('server connected', socket.authorized ? 'authorized' : 'unauthorized');

        socket.setTimeout(1000);

        socket.on('data', data => {
            try {
                logger.verbose('data');

                var packetData = data.toString().split('\n');
                packetData.forEach(function (packet) {
                    if (packet.length > 0) {
                        try {
                            var jsonData = JSON.parse(querystring.unescape(packet));
                            // refactor to add to redis db
                            // console.log(jsonData);
                            logger.verbose(jsonData);
                            const logIdx = crypto.randomBytes(16).toString("hex");

                            const newElement = {
                                key: logIdx,
                                response: jsonData.response
                            }

                            logEntries.push(newElement);

                            let dataChunks = [];

                            sendRequest(jsonData.request, logIdx);
                        } catch (error) {
                            // console.log(error);
                            logger.error(error);
                            // console.log(querystring.unescape(packet));
                            logger.verbose(querystring.unescape(packet));
                            dataChunks.push(utf8Encode.encode(packet));
                        }
                    }
                });

                // dataChunks.push(chunk);
                // console.log(chunk.toString());
                // console.log(`we got data ${dataChunks}`);

            } catch (error) {
                logger.error(error.message);
            }
        });
        socket.on('end', () => {
            logger.verbose('closed');            
            let data = Buffer.concat(dataChunks).toString();
            try {
                logger.verbose(`data: ${data}`);

                if (dataChunks.length > 0) {
                    dataChunks.length = 0;
                    closeData = data.toString().split('\n');
                    closeData.forEach(function (cData) {
                        var jsonData = JSON.parse(querystring.unescape(cData));
                        // refactor to add to redis db
                        // console.log(jsonData);
                        logger.verbose(jsonData);

                        const logIdx = crypto.randomBytes(16).toString("hex");

                        const newElement = {
                            key: logIdx,
                            response: jsonData.response
                        }

                        logEntries.push(newElement);
                        sendRequest(jsonData.request, logIdx);
                    });
                } else {
                    logger.verbose('client disconnected');
                }
            } catch (error) {
                // console.log(error);
                logger.error(error);
                // console.log(querystring.unescape(data));
                logger.verbose(querystring.unescape(data));
            }
        });

        socket.on('error', (err) => {
            logger.error(err.message);
        });
    });


    server.on('connection', function (c) {
        // console.log('insecure connection');
    })

    server.on('secureConnection', function (c) {
        // console.log('secure connection');
    })

    server.on('error', (err) => {
        logger.error(`Server error: ${err}`);
    });

    server.listen(logServerPort, () => {
        logger.info(`Server listening on port ${logServerPort}`);
    });
}


function sendRequest(reqIn, outIdx) {

    let headers = reqIn.headers;
    headers["logIdx"] = outIdx;
    headers["host"] = webTargetIP;

    if (typeof headers["x-forwarded-for"] == 'undefined') {
        // need to get the client IP added to the request log data
        headers["x-forwarded-for"] = reqIn.clientip;
    } else {
        headers["x-forwarded-for"] = reqIn.clientip + "," + headers["x-forwarded-for"];
    }
    // console.log(`reqIn: ${util.inspect(reqIn)}`);
    // console.log(`X-Forwarded-For: ${headers["x-forwarded-for"]}`)
    logger.verbose(`X-Forwarded-For: ${headers["x-forwarded-for"]}`);

    // find the proper XC LB to send the mimicked request to
    logger.debug(`Looking for: ${querystring.unescape(reqIn.virtualServerName)}`);
    const vipTarget = vipTargets.find(element => element.vip === querystring.unescape(reqIn.virtualServerName));
    logger.debug(`Target in XC: ${util.inspect(vipTargets)}`);

    const options = {
        hostname: vipTarget.target,
        port: webTargetPort,
        path: reqIn.uri,
        method: reqIn.method,
        rejectUnauthorized: false,
        headers: headers
    }

    logger.debug(`Options: ${util.inspect(options)}`);
    console.log(`Options: ${util.inspect(options)}`);

    // we are passed the URL + Query String as [http::uri] so, we should be good
    if (reqIn.method.toLowerCase() == "get") {
        // handle the request string
    }
    const http = require('http');

    const req = http.request(options, (res) => {
        let data = '';

        // A chunk of data has been received.
        res.on('data', (chunk) => {
            data += chunk;
            removeElement(logEntries, outIdx);
        });

        // The whole response has been received.
        res.on('end', () => {
        });

    });

    try {
        req.write("{data}");
        // console.log("Request sent");
    } catch (error) {
        // console.log(`Error writing data: ${error.message}`);
        logger.error(`Error sending payload ${error.message}`);
    }

    req.on('error', (e) => {
        // console.log(`Got an error`);
        logger.error(`Problem with request: ${e.message}`);
    });

    req.end();

}

function createWebServer() {
    const httpsWS = require('https');
    const httpWS = require('http');

    const server = httpWS.createServer((req, res) => {

        try {
            if (typeof req.headers['logidx'] == 'undefined') {
                res.setHeader('Content-Type', "application/json");
                res.end("{\"message\": \"Success\"}");
            } else {
                const logEntry = logEntries.find(element => element.key === req.headers['logidx']);
                if (logEntry) {
                    logger.verbose(`Sending a response ${util.inspect(logEntry)}`);
                    const logResponse = logEntry.response;
                    res.headers = logResponse.headers;
                    res.statusCode = logResponse.status;
                    res.end(logResponse.payload);
                    logger.verbose(`Sent: `, logResponse.payload);

                } else {
                    logger.error(`Log Entry not found for ${req.headers['logidx']}`)
                    res.setHeader('Content-Type', "application/json");
                    res.statusCode = 500;
                    res.end(`Error setting content type ${error.message}\n\n`);
                }
            }
        } catch (error) {
            logger.error(`Error in web server: ${(error.message)}`);
            res.statusCode = 500;
            res.setHeader('Content-Type', "application/json");
            res.end(`{"error":"Internal server error ${error.message}"}`);
        }
    });

    server.listen(webServerPort, () => {
        logger.info('Server running at https://' + webServerIP + ':' + webServerPort + '/');
    });
}

// Function to remove an element from the array based on the key
function removeElement(array, removeKey) {
    const index = array.findIndex(element => element.key === removeKey);
    if (index !== -1) {
        // Remove the element from the array
        array.splice(index, 1);
        logger.verbose(`Element with key "${removeKey}" removed successfully.`);
    } else {
        logger.verbose(`Element with key "${removeKey}" not found.`);
    }
}

function createManagementAPI() {
    const httpWS = require('http');

    const server = httpWS.createServer((req, res) => {
        // listen for a call of a particular port for commands to manage the Server

        // /logserver
        // manage the log server
        //    /state POST {"enable": Boolean} => { "result" : success/failure, "message": ""}
        //    /status GET { returns info on the server }
        //    /port POST { "port": Int }
        //    /hostname POST { "hostname": String }
        //    /logging POST { "level": "info/debug/error"}

        // /webserver
        // manage the web server
        //    /state POST {"enable": Boolean} => { "result" : success/failure, "message": ""}
        //    /status GET { returns info on the server }
        //    /port POST { "port": Int }
        //    /hostname POST { "hostname": String }
        //    /logging POST { "level": "info/debug/error"}
        //    

    });

    server.listen(webServerPort, webServerIP, () => {
        logger.info('Server running at http://' + webServerIP + ':' + managementPort + '/')
        console.log('Server running at http://' + webServerIP + ':' + managementPort + '/');
    });
}
