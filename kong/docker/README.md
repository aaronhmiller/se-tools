## Kong Stack

Note that the default Dockerfile uses the ARM image for Kong so that it'll run on an M1 Mac. The alternative Dockerfile-x86 uses the base Kong image that is built for that platform.

The images pulled by the Docker Compose file `docker-compose.yaml` should use either *-x86 or *-arm as appropriate.

### Prerequisites

- Docker installed
- `SALT_TOKEN` obtained from your Salt representative and stored in your repo as a secret or locally as an environment variable.

### Running

`docker compose up -d`

`./add-salt-plugin.sh`

`curl localhost:8000/anything`



### Building and loading your own image

`docker build -t saltaaron/saltykong:1.0.0 -t saltaaron/saltykong:latest .` (Assumes Dockerfile in current directory and these tags should be changed as appropriate to your needs)

`docker push saltaaron/saltykong` (Or whatever your hub.docker.com account is)