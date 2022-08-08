#!/bin/bash
echo "Install Jeedom..."
mkdir -p /opt/jeedom
mkdir -p /opt/jeedom/mysql
mkdir -p /opt/jeedom/html

RFXCOM=/dev/serial/by-id/usb-RFXCOM_RFXtrx433_A11P1M2K-if00-port0
USB2=/dev/serial/by-id/usb-0658_0200-if00

docker run --name jeedom-mysql -v /opt/jeedom/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=jeedom -e MYSQL_PASSWORD=jeedom --detach --publish 3306:3306 --restart always linuxserver/mariadb

docker create --net host --name jeedom-server -v /opt/jeedom/html:/var/www/html -e ROOT_PASSWORD=password -e APACHE_PORT=9080 -e SSH_PORT=9022 -e MODE_HOST=1 --device $RFXCOM:/dev/ttyUSB0 --device $USB2:/dev/ttyACM0 --restart always jeedom/jeedom:master
