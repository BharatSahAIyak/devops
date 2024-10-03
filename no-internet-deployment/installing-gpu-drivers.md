# Installing gpu-drivers

### On Machine1 (with internet)

- `sudo apt-get update`
- `export distro="$(lsb_release -is | tr '[:upper:]' '[:lower:]')$(lsb_release -rs | tr -d '.')"`
- `export arch=$(uname -m)`
- `mkdir -p ~/gpu-packages`
- `cd ~/gpu-packages`
- `wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.1-1_all.deb`
- `sudo dpkg -i cuda-keyring_1.1-1_all.deb`
- `sudo apt-get update`
- ```
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  ```
- `sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \`

- `sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list`

- ```
    sudo apt-get update
    sudo apt-get install --download-only cuda-drivers
    sudo apt-get install --download-only nvidia-container-toolkit
    sudo apt-get install --download-only nvidia-docker2
  ```
- `sudo cp /var/cache/apt/archives/*.deb ~/gpu-packages/`
- `tar -czvf gpu-packages.tar.gz -C ~/gpu-packages . `
- `ssh user@<PublicIP> "mkdir -p ~/gpu-packages`
- `scp gpu-packages.tar.gz  user@<PublicIP>:~/gpu-packages/`

   Update `user@<PublicIP>` with Machine2 User and IP

### On Machine2 (without internet)

- `cd ~/gpu-packages`
- `tar -xzvf gpu-packages.tar.gz`
- `sudo dpkg -i *.deb`
- ````
    if [ ! -s "/etc/docker/daemon.json" ]; then \
        sudo sh -c "echo \"{}\" > /etc/docker/daemon.json"; \
    fi
    sudo sh -c "jq '.[\"log-driver\"] =\"json-file\" | (.[\"log-opts\"] | .[\"labels-regex\"] ) = \"^.+\" | .[\"max-concurrent-downloads\"] = 20 ' /etc/docker/daemon.json > /etc/docker/daemon.json.tmp"
    sudo sh -c "mv -f /etc/docker/daemon.json.tmp /etc/docker/daemon.json ; chmod 0644 /etc/docker/daemon.json"
    sudo systemctl daemon-reload
    sudo systemctl restart docker

