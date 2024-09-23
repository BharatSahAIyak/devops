# Installing Docker

### On Machine1 (with internet)

- `sudo apt-get update`
- `sudo apt-get install -y ca-certificates curl`
- `sudo install -m 0755 -d /etc/apt/keyrings`
- `sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`
- `sudo chmod a+r /etc/apt/keyrings/docker.asc`

- Add Docker's repository to your apt sources

    ```
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get update
    ```

- `mkdir -p ~/docker-packages`
- `cd ~/docker-packages`
- `sudo apt-get download docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
- `tar -czvf docker-packages.tar.gz -C ~/ docker-packages`
- `ssh user@<PublicIP> "mkdir -p ~/docker-images"`
- `scp docker-packages.tar.gz <user>@<PublicIP>:~/docker-packages/`

   Update `user@<PublicIP>` with Machine2 User and IP


### On Machine2 (without internet)

- `cd ~/docker-packages`
- `tar -xzvf docker-packages.tar.gz`
- `sudo dpkg -i *.deb`
- Verfiy using `docker --version`