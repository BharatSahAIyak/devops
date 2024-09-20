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