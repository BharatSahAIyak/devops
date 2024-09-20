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