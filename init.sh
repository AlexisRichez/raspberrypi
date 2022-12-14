#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Docker..."
if [ -x "$(command -v docker)" ]; then
 echo "Docker is already installed"
else
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker pi
fi

echo "Install Portainer (Visualizing Docker containers)..."
docker pull portainer/portainer:linux-arm
docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer:linux-arm
