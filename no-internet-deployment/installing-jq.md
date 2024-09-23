# Installing jq

### On Machine1 (with internet)
- `sudo wget https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-amd64`
- `scp jq-linux-amd64 user@<PublicIP>:/tmp/jq_linux_amd64`

Update `user@<PublicIP>` with Machine2 User and IP

### On Machine2 (without internet)

- `sudo mv /tmp/jq_linux_amd64 /usr/bin/jq`
- `sudo chmod +x /usr/bin/jq`
- `jq --version`