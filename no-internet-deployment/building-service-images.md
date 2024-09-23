# Setting up services which are built on machine

### On Machine1 (with internet)

- Setup [BharatSahAlyak/devops]("https://github.com/BharatSahAIyak/devops") repository.
- cd `~/devops/bhasai/` 
- Uncomment ` - ./bhasai/docker-compose.SDC.yaml` from `./docker-compose.SDC.yaml`
- Comment out `- ./ai_tools/docker-compose.yaml` in `docker-compose.SDC.yaml`
- cd `~/devops`
- `SDC=1 make deploy services=admin`
- `docker save -o your_image_name.tar your-image-name`
  Replace your-image-name with the name of the `image:tag`
- `ssh user@<PublicIP> "mkdir -p ~/docker-images`
- Transfer the Image `scp your_image_name.tar user@<PublicIP>:~/docker-images/`

### On Machine2 (without internet)

- `cd ~/docker-images`
- `docker load -i your_image_name.tar`
- Verify using `docker images`
- `cd ~/devops`
- Deplpy using `DISABLE_PULL=1 SDC=1 make deploy services=service-name`