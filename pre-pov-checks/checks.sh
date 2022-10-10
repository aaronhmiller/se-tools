#!/bin/sh

echo "1. Checking connectivity using netcat..."
nc -z -v -w 5 services-a.dnssf.com 443 2> /dev/null
if [ $? = 0 ]
then
  echo "   netcat connectivity OK."
else
  echo "   There is a problem. Check firewall and proxy rules."
fi

echo "2. Checking connectivity using cURL..."
curl -s -I -o /dev/null https://traffic-receiver-http-ns-a.dnssf.com/api/v1/http/hello 2> /dev/null
if [ $? = 0 ]
then
  echo "   curl connectivity OK."
else
  echo "   There is a problem. Check firewall and proxy rules."
fi

echo "3. Checking TLS certificate..."
echo "Q" | openssl s_client -connect traffic-receiver-a.dnssf.com:443 2> /dev/null | openssl x509 -subject -noout|grep -q "*.dnssf.com"
if [ $? = 0 ]
then
  echo "   openssl check passed."
else
  echo "   The expected certificate was not found. Check TLS rewrite rules."
fi
