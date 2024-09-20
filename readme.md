# Requirements

### Hardware Requirements

- Ram (>56 GB)
- GPU (>16 GB) - Nvidia Based 
- CPU (>8 Core)
- Disk IOPS (>5000)

### OS Requirements

- Ubuntu 22.04 LTS

### Network Requirements

- 80, 443 (exposing services, port 80 is needed to be able to auto generate certificates)
- 9000 (webhook server)
- 22 (ssh) - if public ssh access is needed

### Domain Requirements

- A wildcard domain mapped to the machine (example *.example.com mapped to machine ip)

### Required Credentials

- Image Registry (username and password) - to pull images of services
- Github Repository Read Credentials (username and password) - to pull code of services (where service is built on machine, e.g., app)
- Other API Credentials depending upon functionalities (OpenAI API Key, Gupshup Credentials, BHASHINI Credentials, Azure Translate Credentials)

# Stack

### Database 
- Postgres, Redis, Clickhouse, 
- Prometheus (Time Series Databas for Metrics)
- Loki (Logs Storage)
- Minio (Object Storage)
- Vault (Credential Storage)

### Dashboarding/Analytics 
- Grafana, Superset

### Authentication Management 
- FusionAuth

### Alerts Managament 
- Uptime

### Exporters
- Node Metrics (nodeexporter)
- Container Metrics (Cadvisor)
- Logs (Promtail) 

## Proxy 
- Caddy

# Setup

### System Setup

1. Run `sudo apt-get install build-essential` to install pre-requisites
2. Clone this repository in the VM and change directory to cloned repository
3. Run `make install-docker` to install docker
4. Exit out of VM and re-connect to the VM to reflect the latest user changes
5. Run `make setup-daemon` to configure the docker daemon
7. Run `make install-gpu-drivers` to install gpu drivers (ensure secure boot is turned off, restart the machine to ensure gpu drivers function properly)

### Services Setup

1. Use `docker login ghcr.io` to login into registry
2. Update sample.env and add random-generate in front of all variables you want to generate randomly and random-generate-lower in front of all variables you want to generate randomly but only in lowercase
3. Run `make generate-env` to generate a .env file with randomly filled values for variable you requested for in step 2

Format for AI_SERVICES environment variable is as follows ([services](https://github.com/BharatSahAIyak/ai-tools/blob/dev/config.json) can be found here)

```
AI_SERVICES='{
    "models": [
      {
        "serviceName": "bge_reranker",
        "apiBasePath": "rerankers/bge_base/local/",
        "containerPort": 8000,
        "environment": {
          "NVIDIA_VISIBLE_DEVICES": "${NVIDIA_VISIBLE_DEVICES}"
        },
        "gpu": false
      }
    ]
  }'
```
4. Update other environment variables in .env file
4. Run `make deploy` to deploy the system 

### Setup Webhook Service

1. Run `sudo make setup-webhook` to start the webhook service (use kill -9 $(lsof -t -i:9000) to kill any existing service on 9000 port)

### Setting up FA Application for Bot

1. Create an Application in Fusionauth (Enable JWT, set access token expiry to 2592000, set access token signing key to auto generate)

### Setting up Github Action for CD

1. Go to Actions tab in the repo and enable actions
2. Add {Environment}_WEBHOOK_PASSWORD and {Environment}_WEBHOOK_URL as repository secrets (the Environment here should be in uppercase letters and can be any name that you want to give to environment e.g., DEV)

# Maintenance and Debugging

### Maintaining Servies

1. Grafana can be used to view logs
2. Environments variables can be updated through Vault
3. A github action can be used to redeploy services directly through Github

### Observability

1. Alerts related to node and containers can be sent to discord channel by providing DISCORD_WEBHOOK_URL in .env
2. Uptime can be used to configure alerts externally on any URL (multiple channels can be configured depending upon preference)


### Upgrading Services 

Every custom services (built by BHASAI Team) in docker-compose.yaml has variables defined to update image tag/ memory limit, cpus etc.

Example. If you want to upgrade a specific service x_y to  a newer image tag, you can update the variable X_Y_IMAGE_TAG in vault and redeploy it using github actions 

### Useful Commands 

1. Deploy a newly added service or pull and redeploy a service

    `make deploy [services=<service_name>]`

3. Stop a service 

    `make stop [services=<service_name>]`

4. Restart a service 

    `make restart [services=<service_name>]`

5. Delete a service 

    `make down [services=<service_name>]`
    
    Note: Volumes are preserved
    
6. Pull images
    `make pull [services=<service_name>]`

7. Build images
    `make build [services=<service_name>]`

### Useful Utilities

1. Migrate Volume from localhost to localhost/remote 

    `make migrate-volume` 

> [!NOTE]
>  Optional environment variable to tweak behaviour of Makefile:
> 1. `ENABLE_FORCE_RECREATE` (set this to 1 to enable force recreations of containers every time a service is deployed)
> 2. `DISABLE_ANSI` (set this to 1 to prevent ANSI output from Docker CLI)
> 3. `DISABLE_REMOVE_ORPHANS` (orphan containers are removed by default when your run `make deploy` without <service_name>, set this to 1 to disable this behaviour)
> 4. `DISABLE_PULL` (images are pulled/rebuilt by default (if you provide `<service_name>`, image for only that service is pulled/rebuilt) when you run `make deploy [services=<service_name>]`,  set this to 1 to disable this behaviour)
> 5. `<service_name>` accepts either one or multiple values separated by space
> 6. `ENABLE_GIT_PULL` (set this to 1 to automatically pull the latest code from the checked out branch before deploying services)
