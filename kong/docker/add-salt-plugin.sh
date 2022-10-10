#!/bin/sh
http :8001/services name=httpbin url=https://httpbin.org/anything
http :8001/services/httpbin/routes name=httpbin-route paths=/anything -f
#pull from admin and use INSTALLATION not RAW token
http :8001/plugins name=salt-sensor config.salt_domain=traffic-receiver-http.dnssf.com config.salt_token=$SALT_TOKEN -f
