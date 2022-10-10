## Between qualifying POV and starting it, there are a few CRITICAL steps to take. This is a guide to those steps.



### Network connectivity verifications

#### Test connectivity to Salt services

From either the Sensor or the Hybrid, verify the following

1. `nc -z -v -w 5 services-a.dnssf.com 443`

Tests connectivity to one of the Salt services. The `-z` option just scans for a listener w/o sending data. `-w` is a wait flag and `-v` gives more verbose output.

2. `curl -v https://traffic-receiver-http-ns-a.dnssf.com/api/v1/http/hello`

This tests the ability of the machine running the Hybrid to reach out from the customer's network to one of the required Salt services. Because we are not passing authentication credentials, expect a `401` but the host should resolve and the TLS connection should be made.

3. `openssl s_client -connect traffic-receiver-a.dnssf.com:443` (ctrl-C to return to shell prompt)

This tests if TLS is being rewritten. The Hybrid requires a direct connection to Salt services. Sometimes, TLS certificates are rewritten to intercept TLS encrypted traffic.



A convenience script has been included to run these three checks and verify expected output.