#!/bin/bash
echo "Install Jeedom..."
mkdir /opt/jeedom
mkdir /opt/jeedom/mysql

docker run --name jeedom-mysql -v /opt/jeedom/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=jeedom -e MYSQL_PASSWORD=jeedom --detach --publish 3306:3306 --restart always linuxserver/mariadb
