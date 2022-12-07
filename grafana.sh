#!/bin/bash

# Kill container running on port 3000
docker kill $(docker ps -qf expose=3000) 2> /dev/null || echo 'No container running on port 3000'

# Remove existing docker image if exists
result=$( docker images -q grafana/grafana )
if [[ -n "$result" ]]; then
    docker rmi -f grafana/grafana
fi

# Remove existing docker container if exists
result=$( docker ps -q -f name=grafana/grafana )
if [[ -n "$result" ]]; then
    docker container rm -f grafana/grafana
fi

# Docker pull
docker pull grafana/grafana:latest

# Create the required folders and set the correct permission
mkdir /var/lib/grafana -p
chown -R 472:472 /var/lib/grafana

# Run docker image
docker run -d -p 3000:3000 -v /var/lib/grafana:/var/lib/grafana grafana/grafana
