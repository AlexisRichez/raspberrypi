#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Docker..."
apt-get install y docker
usermod -aG docker pi

echo "Install Portainer (Visualizing Docker containers)..."
docker pull portainer/portainer:linux-arm
docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer:linux-arm
