# Asumptions Made
- Machine1: Machine having internet on which we will download packages
- Machine2: Machine without internet on which we will transfer and install packages


# Prerequisite
- Ensure that the OS configurations on the internet-connected machine(Machine1) match those on the offline machine for deployment(Machine2)
- It is advisable to set up a new Machine1 to prevent configuration mismatches.
- After setting up both machines, add Machine1’s SSH public key to the authorized_keys file on Machine2


Documentations
1. [Installing_yq](./installing_yq.md)
2. [Installing_jq](./installing_jq.md)
3. [Installing_Build_Essentials](./installing_build_essentials.md)
4. [Installing_Docker_Packages](./installing_docker_packages.md)
5. [Loading_docker_images](./loading_docker_images.md)
