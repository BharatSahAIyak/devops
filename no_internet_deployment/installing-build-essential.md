# Installing build-essential

### On Machine1 (with internet)

- `sudo apt-get update`
- `sudo apt-get install --download-only build-essential`
- `mkdir -p ~/build-essential-packages`
- `sudo cp /var/cache/apt/archives/*.deb ~/build-essential-packages/`
- `tar -czvf build-essential-packages.tar.gz -C ~/build-essential-packages .`
- `ssh user@<PublicIP> "mkdir -p ~/build-essential-packages"`
- `scp build-essential-packages.tar.gz user@<PublicIP>:~/build-essential-packages/`

   Update `user@<PublicIP>` with Machine2 User and IP

### On Machine2 (without internet)

- `cd ~/build-essential-packages`
- `tar -xzvf build-essential-packages.tar.gz`
- `sudo dpkg -i *.deb`