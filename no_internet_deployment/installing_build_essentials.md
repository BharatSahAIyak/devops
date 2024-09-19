# Installing build essentials

### On Machine1 (with internet)

- `sudo apt-get update`
- `sudo apt-get install --download-only build-essential`
- `mkdir -p ~/build-essential-packages`
- `sudo cp /var/cache/apt/archives/*.deb ~/build-essential-packages/`
- `tar -czvf build-essential-packages.tar.gz -C ~/build-essential-packages .`

### On Machine2 (without internet) create a directory to transfer .tar file created

- `mkdir ~/build-essential-packages`

### On Machine1

- `scp -i "sshPrivateKey" build-essential-packages.tar.gz user@<PublicIP>:~/build-essential-package/`

   Update **sshPrivateKey** with your Machine1 private key eg: `~/.ssh/id_rsa` and `user@<PublicIP>` with Machine2 User and IP

### On Machine2 

- `cd ~/build-essential-package`
- `tar -xzvf build-essential-packages.tar.gz`
- `sudo dpkg -i *.deb`