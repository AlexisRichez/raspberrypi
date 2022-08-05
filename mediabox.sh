#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Radarr..."
mkdir /opt/radarr/data
docker pull linuxserver/radarr

docker run -d --name=radarr -e TZ=Europe/London -p 7878:7878 -v /opt/radarr/data:/config -v /media/NAS/movies:/movies -v /media/NAS/download/:/downloads --restart unless-stopped lscr.io/linuxserver/radarr:latest
