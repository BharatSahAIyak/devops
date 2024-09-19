# Installing yq

### On Machine1 (with internet)

- `sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64`
- `scp -i "sshPrivateKey" yq_linux_amd64 user@<PublicIP>:/tmp/yq_linux_amd64`

Update **sshPrivateKey** with your Machine1 private key eg: `~/.ssh/id_rsa` and `user@<PublicIP>` with Machine2 User and IP

### On Machine2 (without internet)

- `sudo mv /tmp/yq_linux_amd64 /usr/bin/yq`
- `sudo chmod +x /usr/bin/yq`
- `yq --version`