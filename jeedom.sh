#!/bin/bash
"Install Jeedom..."
mkdir /opt/jeedom
mkdir /opt/jeedom/www
mkdir /opt/jeedom/db
docker pull jeedom/jeedom:V4-stable
docker run --name jeedom-server -v /opt/jeedom/www:/var/www/html -v /opt/jeedom/db:/var/lib/mysql -p 9080:80 –restart always jeedom/jeedom:V4-stable
