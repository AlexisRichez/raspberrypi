#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Radarr..."
mkdir /opt/radarr/data
docker pull rafaelncarvalho/rpi-radarr

docker run -d -p 7878:7878 \
-v /media/NAS/movies:/volumes/media \
-v /opt/radarr/data:/volumes/config \
-v /etc/localtime:/etc/localtime:ro \
--restart unless-stopped \
--name radarr \
rafaelncarvalho/rpi-radarr
