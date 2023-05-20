#!/bin/bash

# Install and Update
sudo apt update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg -y 

wget https://download.docker.com/linux/debian/gpg
sudo apt-key add gpg

echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
sudo systemctl status docker 

# Run the docker container
docker run -it --rm -d -e ROOT_PASSWORD=secret -p 20022:22 vulhub/openssh:7.7
