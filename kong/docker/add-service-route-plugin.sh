#!/bin/sh
http :8001/services name=httpbin url=https://httpbin.org/anything
http :8001/services/httpbin/routes name=httpbin-route paths=/anything -f
http :8001/plugins name=rate-limiting config.minute=5 -f
