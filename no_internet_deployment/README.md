# Assumptions
- Machine1: The machine with internet access, which will be used to download packages.
- Machine2: he machine without internet access, to which packages will be transferred and installed.


# Prerequisites
- Ensure that the OS configurations on the internet-connected machine(Machine1) match those on the offline machine for deployment(Machine2) by running the following commands.
- `uname -a`
- `cat /etc/os-release`
- It is advisable to set up a new Machine1 to prevent configuration mismatches.
- After setting up both machines, add Machine1’s SSH public key to the `authorized_keys` file on Machine2


Documentations
1. [Installing yq](./installing_yq.md)
2. [Installing jq](./installing_jq.md)
3. [Installing Build-Essentials](./installing_build_essentials.md)
4. [Installing Docker](./installing_docker_packages.md)
5. [Loading Docker-images](./loading_docker_images.md)
