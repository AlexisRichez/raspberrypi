#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Radarr..."
docker pull linuxserver/radarr

docker run -d \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 7878:7878 \
  -v /opt/radarr/data:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/radarr:latest
