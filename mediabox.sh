#!/bin/bash
apt-get update
apt-get upgrade

echo "Install Radarr..."
cd rpi-radarr/
# Buikd image
docker build -t rpi-radarr .
# Run docker image on port 7878
docker run --restart always -d -p 7878:7878 -v /media/NAS:/media/NAS rpi-radarr
