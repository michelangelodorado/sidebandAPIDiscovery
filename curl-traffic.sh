#!/bin/sh

MINWAIT=10
MAXWAIT=30

for d in {0..100..10}
do
    curl -X GET "https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/get" -H "accept: application/json"  -H 'Accept-Language: en-US,en;q=0.9' -H 'Cache-Control: no-cache' -H 'Cookie: notice_behavior=implied,us; _a1_f=c0dbff3a-1088-479d-9c13-4e41ccc13ac4; da_lid=9189AD439A73EA170528BB99F12F5CC324|0|0|0; ADRUM=s=1683649905083&r=https%3A%2F%2Factivate.f5.com%2Flicense%2Flicense.do%3Bjsessionid%3D8B7FF46A9A6046D127579C1BE4F1C52C%3F0; udf.sid=s%3Ay_C4yABsVXO0jqx4KJf3H_dKY_bzICXM.M39sDRApGFFCPQwXhY3Thz3Gp31w35ANAyuSiI6EYAU; s_cc=true; s_fid=675A8751529C2149-121C0E4528CD225D; s_sq=%5B%5BB%5D%5D; _gcl_au=1.1.55034272.1685634777; _ga=GA1.2.1807462661.1685634777; _gid=GA1.2.1513256866.1685634777; utag_main=v_id:018877a97d75000b23e69dfbe11c05075004a06d00fb8$_sn:1$_se:3$_ss:0$_st:1685636664246$ses_id:1685634776438%3Bexp-session$_pn:3%3Bexp-session; _hp2_id.undefined=%7B%22userId%22%3A%228719347210711973%22%2C%22pageviewId%22%3A%222001774325455953%22%2C%22sessionId%22%3A%22839465157129405%22%2C%22identity%22%3Anull%2C%22trackerVersion%22%3A%224.0%22%7D'  -H 'Pragma: no-cache'  -H 'Referer: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' -H 'accept: application/json'   -H 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "macOS"' 
    sleep $((MINWAIT+RANDOM % (MAXWAIT-MINWAIT)))
    curl -X PUT "https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/put" -H "accept: application/json" --data-raw "patch"  -H 'Accept-Language: en-US,en;q=0.9' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Cookie: notice_behavior=implied,us; _a1_f=c0dbff3a-1088-479d-9c13-4e41ccc13ac4; da_lid=9189AD439A73EA170528BB99F12F5CC324|0|0|0; ADRUM=s=1683649905083&r=https%3A%2F%2Factivate.f5.com%2Flicense%2Flicense.do%3Bjsessionid%3D8B7FF46A9A6046D127579C1BE4F1C52C%3F0; udf.sid=s%3Ay_C4yABsVXO0jqx4KJf3H_dKY_bzICXM.M39sDRApGFFCPQwXhY3Thz3Gp31w35ANAyuSiI6EYAU; s_cc=true; s_fid=675A8751529C2149-121C0E4528CD225D; s_sq=%5B%5BB%5D%5D; _gcl_au=1.1.55034272.1685634777; _ga=GA1.2.1807462661.1685634777; _gid=GA1.2.1513256866.1685634777; _hp2_id.undefined=%7B%22userId%22%3A%228719347210711973%22%2C%22pageviewId%22%3A%222992157812048182%22%2C%22sessionId%22%3A%22854312441100925%22%2C%22identity%22%3Anull%2C%22trackerVersion%22%3A%224.0%22%7D; AMCVS_347AE3BC558C64417F000101%40AdobeOrg=1; AMCV_347AE3BC558C64417F000101%40AdobeOrg=359503849%7CMCIDTS%7C19511%7CMCMID%7C76576997104612370041247525941503982069%7CMCAAMLH-1686270175%7C7%7CMCAAMB-1686270175%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1685672575s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C5.0.1; utag_main=v_id:018877a97d75000b23e69dfbe11c05075004a06d00fb8$_sn:2$_se:2$_ss:0$_st:1685667177662$ses_id:1685665374970%3Bexp-session$_pn:2%3Bexp-session$vapi_domain:f5.com' -H 'Origin: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com' -H 'Pragma: no-cache' -H 'Referer: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' -H 'accept: application/json'
    sleep $((MINWAIT+RANDOM % (MAXWAIT-MINWAIT)))
    curl -X POST "https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/post" -H "accept: application/json" --data-raw "{this is data}"  -H 'Accept-Language: en-US,en;q=0.9' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Cookie: notice_behavior=implied,us; _a1_f=c0dbff3a-1088-479d-9c13-4e41ccc13ac4; da_lid=9189AD439A73EA170528BB99F12F5CC324|0|0|0; ADRUM=s=1683649905083&r=https%3A%2F%2Factivate.f5.com%2Flicense%2Flicense.do%3Bjsessionid%3D8B7FF46A9A6046D127579C1BE4F1C52C%3F0; udf.sid=s%3Ay_C4yABsVXO0jqx4KJf3H_dKY_bzICXM.M39sDRApGFFCPQwXhY3Thz3Gp31w35ANAyuSiI6EYAU; s_cc=true; s_fid=675A8751529C2149-121C0E4528CD225D; s_sq=%5B%5BB%5D%5D; _gcl_au=1.1.55034272.1685634777; _ga=GA1.2.1807462661.1685634777; _gid=GA1.2.1513256866.1685634777; _hp2_id.undefined=%7B%22userId%22%3A%228719347210711973%22%2C%22pageviewId%22%3A%222992157812048182%22%2C%22sessionId%22%3A%22854312441100925%22%2C%22identity%22%3Anull%2C%22trackerVersion%22%3A%224.0%22%7D; AMCVS_347AE3BC558C64417F000101%40AdobeOrg=1; AMCV_347AE3BC558C64417F000101%40AdobeOrg=359503849%7CMCIDTS%7C19511%7CMCMID%7C76576997104612370041247525941503982069%7CMCAAMLH-1686270175%7C7%7CMCAAMB-1686270175%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1685672575s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C5.0.1; utag_main=v_id:018877a97d75000b23e69dfbe11c05075004a06d00fb8$_sn:2$_se:2$_ss:0$_st:1685667177662$ses_id:1685665374970%3Bexp-session$_pn:2%3Bexp-session$vapi_domain:f5.com' -H 'Origin: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com' -H 'Pragma: no-cache' -H 'Referer: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' -H 'accept: application/json'
    sleep $((MINWAIT+RANDOM % (MAXWAIT-MINWAIT)))
    curl 'https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/delete' -X 'DELETE' --data-raw "{deleteme}" -H 'Accept-Language: en-US,en;q=0.9' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Cookie: notice_behavior=implied,us; _a1_f=c0dbff3a-1088-479d-9c13-4e41ccc13ac4; da_lid=9189AD439A73EA170528BB99F12F5CC324|0|0|0; ADRUM=s=1683649905083&r=https%3A%2F%2Factivate.f5.com%2Flicense%2Flicense.do%3Bjsessionid%3D8B7FF46A9A6046D127579C1BE4F1C52C%3F0; udf.sid=s%3Ay_C4yABsVXO0jqx4KJf3H_dKY_bzICXM.M39sDRApGFFCPQwXhY3Thz3Gp31w35ANAyuSiI6EYAU; s_cc=true; s_fid=675A8751529C2149-121C0E4528CD225D; s_sq=%5B%5BB%5D%5D; _gcl_au=1.1.55034272.1685634777; _ga=GA1.2.1807462661.1685634777; _gid=GA1.2.1513256866.1685634777; _hp2_id.undefined=%7B%22userId%22%3A%228719347210711973%22%2C%22pageviewId%22%3A%222992157812048182%22%2C%22sessionId%22%3A%22854312441100925%22%2C%22identity%22%3Anull%2C%22trackerVersion%22%3A%224.0%22%7D; AMCVS_347AE3BC558C64417F000101%40AdobeOrg=1; AMCV_347AE3BC558C64417F000101%40AdobeOrg=359503849%7CMCIDTS%7C19511%7CMCMID%7C76576997104612370041247525941503982069%7CMCAAMLH-1686270175%7C7%7CMCAAMB-1686270175%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1685672575s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C5.0.1; utag_main=v_id:018877a97d75000b23e69dfbe11c05075004a06d00fb8$_sn:2$_se:2$_ss:0$_st:1685667177662$ses_id:1685665374970%3Bexp-session$_pn:2%3Bexp-session$vapi_domain:f5.com' -H 'Origin: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com' -H 'Pragma: no-cache' -H 'Referer: https://66c6478e-65ae-45e5-9bc4-d9aaed330117.access.udf.f5.com/' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36' -H 'accept: application/json'  
    sleep $((MINWAIT+RANDOM % (MAXWAIT-MINWAIT)))
    
done




  
