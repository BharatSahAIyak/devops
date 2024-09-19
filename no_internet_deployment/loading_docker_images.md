# How to Use a Docker Image Offline

### On Machine1 (with internet)

- Pre-download the Image `docker pull hello-world`
- Save the Image `docker save -o hello-world.tar hello-world`

In case of tags with image name replace `:`  and `/` with `_` <br>
```
eg:  docker save -o fusionauth_fusionauth-app_1.49.2.tar fusionauth/fusionauth-app:1.49.2
```

### On Machine2 (without internet) create a directory to transfer .tar file created

- `mkdir ~/docker-images`

### On Machine1

- Transfer the Image `scp hello-world.tar user@<PublicIP>:~/docker-images`

### On Machine2

- `cd ~/docker-images`
- `docker load -i hello-world.tar`
- Verify using `docker images`