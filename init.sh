#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker pi

echo "Install Portainer (Visualizing Docker containers)..."
docker pull portainer/portainer:linux-arm
