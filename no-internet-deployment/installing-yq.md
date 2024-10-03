# Installing yq

### On Machine1 (with internet)

- `sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64`
- `scp yq_linux_amd64 user@<PublicIP>:/tmp/yq_linux_amd64`

Update `user@<PublicIP>` with Machine2 User and IP

### On Machine2 (without internet)

- `sudo mv /tmp/yq_linux_amd64 /usr/bin/yq`
- `sudo chmod +x /usr/bin/yq`
- `yq --version`