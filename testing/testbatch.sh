#! /bin/sh
# echo off
echo username: $1
echo host: $2
echo productid: $3

curl --silent --location https://$2/api/Users/ --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Content-Type: application/json' --header 'Cookie: notice_behavior=implied,us; _a1_f=c0dbff3a-1088-479d-9c13-4e41ccc13ac4; da_lid=9189AD439A73EA170528BB99F12F5CC324|0|0|0; ADRUM=s=1683649905083&r=https%3A%2F%2Factivate.f5.com%2Flicense%2Flicense.do%3Bjsessionid%3D8B7FF46A9A6046D127579C1BE4F1C52C%3F0; LSKey-CoveoV2$coveo_visitorId=c069bab2-1936-1345-0b72-bd8a333d38b7; AMCV_347AE3BC558C64417F000101%40AdobeOrg=359503849%7CMCIDTS%7C19542%7CMCMID%7C76576997104612370041247525941503982069%7CMCAAMLH-1689014702%7C7%7CMCAAMB-1689014702%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1688417102s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C5.0.1; AMCVS_347AE3BC558C64417F000101%40AdobeOrg=1; utag_main=v_id:01891d13eaea008bac23224af4f005075003706d01328$_sn:1$_se:1$_ss:1$_st:1688411791916$ses_id:1688409991916%3Bexp-session$_pn:1%3Bexp-session$vapi_domain:f5.com; s_cc=true; s_fid=35AC620259482892-2497F9102DC219BA; s_sq=%5B%5BB%5D%5D; _ga_NM23H28J3M=GS1.1.1688409992.1.0.1688409992.60.0.0; _ga=GA1.2.278229091.1688409992; _gid=GA1.2.2070667049.1688409992; udf.sid=s%3A4EklVAkC4Al_f4yhSnm1uJcRsg8LsyTX.IB8ACqA8HqMBzirxPUYc2P0jG7nCEM9CuZ%2FC6kWSRgE; intercom-session-whq08301=L0VKZmU1MUM5MWxuTWV4c21ZSzlQVWNvNWdJYjdZTmE1S09QV2ZuVnF4WFdhZGxNd1lzbzQ3bk15UUNoYmlpeS0tanROVnIxQ2hpaGhGT2h0TEw2VzcvZz09--6f5ee7a625aab5ee41ee4ad880847f5cd811f77f; intercom-device-id-whq08301=4478eed2-c27c-4d03-adbb-8469d14c2726; _hp2_id.undefined=%7B%22userId%22%3A%228106934188416576%22%2C%22pageviewId%22%3A%228649209749720415%22%2C%22sessionId%22%3A%22786571500615541%22%2C%22identity%22%3Anull%2C%22trackerVersion%22%3A%224.0%22%7D; language=en; welcomebanner_status=dismiss' --header 'Origin: https://$2' --header 'Pragma: no-cache' --header 'Referer: https://$2/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Not.A/Brand";v="8", "Chromium";v="114", "Google Chrome";v="114"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"' --data-raw '{
    "email": "'$1'",
    "password": "test2361",
    "passwordRepeat": "test2361",
    "securityQuestion": {
        "id": 3,
        "question": "Mother'\''s birth date? (MM/DD/YY)"
    },
    "securityAnswer": "Her birthday"
}'
auth_token=$(curl --silent --location https://$2/rest/user/login --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Content-Type: application/json' --header 'Cookie: language=en; welcomebanner_status=dismiss' --header 'Origin: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"' --data-raw '{
    "email": "$1",
    "password": "test2361"
}' | jq .authentication.token )

echo /api/Quantitys/
curl --silent --location https://$2/api/Quantitys/ --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss;' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'
echo whoami
curl --silent --location https://$2/rest/user/whoami --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo reviews
curl --silent --location https://$2/rest/products/$3/reviews --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo languages
curl --silent --location https://$2/rest/languages --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss;' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo app-version
curl --silent --location https://$2/rest/admin/application-version --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss;' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo app-config
curl --silent --location https://$2/rest/admin/application-configuration --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss;' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo basketitems
curl --silent --location --request PUT https://$2/api/BasketItems/$3 --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Content-Length: 14' --header 'Content-Type: application/json' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"' --data '{
 "quantity": 4
}'

echo basket
curl --silent --location https://$2/rest/basket --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Cookie: language=en; welcomebanner_status=dismiss;' --header 'Pragma: no-cache' --header 'Referer: https://ab52683e-839d-411b-a49e-6e83f4827e05.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo search
curl --silent --location https://$2/rest/products/search?q=Apple --header 'Accept: application/json, text/plain, */*' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo address
curl --silent --location https://$2/api/Addresss --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo export
curl --silent --location https://$2/rest/user/data-export --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Content-Length: 14' --header 'Content-Type: application/json' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"' --data '{
 "format": "1"
}'

echo order-history
curl --silent --location https://$2/rest/order-history --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo cards
curl --silent --location http://$2/api/Cards/ --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Content-Length: 82' --header 'Content-Type: application/json' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"' --data '{
 "fullName": "Me Im Me",
 "cardNum": 5555123412232345,
 "expMonth": "6",
 "expYear": "2085"
}'

echo list cards
curl --silent --location https://$2/api/Cards --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer '$auth_token'' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Pragma: no-cache' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

echo feedback
curl --silent --location --globoff https://$2/api/Feedbacks/ --header 'Accept: application/json, text/plain, */*' --header 'Accept-Encoding: gzip, deflate, br' --header 'Accept-Language: en-US,en;q=0.9' --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjEsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJ0ZXN0MjM0QHRlc3QuY29tIiwicGFzc3dvcmQiOiIwZmJmOTdhZjUwNTM2ZDI4NDgwZTY0ZDgxMGE1Yzk4ZiIsInJvbGUiOiJjdXN0b21lciIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiJ1bmRlZmluZWQiLCJwcm9maWxlSW1hZ2UiOiIvYXNzZXRzL3B1YmxpYy9pbWFnZXMvdXBsb2Fkcy9kZWZhdWx0LnN2ZyIsInRvdHBTZWNyZXQiOiIiLCJpc0FjdGl2ZSI6dHJ1ZSwiY3JlYXRlZEF0IjoiMjAyMy0wNi0yNyAxNjoxNzo1NS4zODUgKzAwOjAwIiwidXBkYXRlZEF0IjoiMjAyMy0wNi0yOCAxMzowMjoyNS41MjkgKzAwOjAwIiwiZGVsZXRlZEF0IjpudWxsfSwiaWF0IjoxNjg3OTU3MzUzfQ.Jwl5cpOkysCALluQduaDx7PU2vb_MmdjmT2MuB3a49cZG3u6Md6D4x67KZbL6L8_PsrS7zOZTwa-lAkpjLicfFfCpGO5eY_H5ggjy69KSH8zzu7eoP8iKoK5hNCJPsfSvrK1aZO-MPwmIuUeb_3RtHuhClNN60j4vGGvDhQ7v3U' --header 'Cache-Control: no-cache' --header 'Connection: keep-alive' --header 'Host: 9fd752e0-90c6-4d3c-9abe-36f12572f507.access.udf.f5.com' --header 'Pragma: no-cache' --header 'Referer: https://9fd752e0-90c6-4d3c-9abe-36f12572f507.access.udf.f5.com/' --header 'Sec-Fetch-Dest: empty' --header 'Sec-Fetch-Mode: cors' --header 'Sec-Fetch-Site: same-origin' --header 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' --header 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' --header 'sec-ch-ua-mobile: ?0' --header 'sec-ch-ua-platform: "macOS"'

