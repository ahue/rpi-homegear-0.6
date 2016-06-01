#!/bin/sh

openssl genrsa -out /etc/homegear/homegear.key 2048
openssl req -batch -new -key /etc/homegear/homegear.key -out /etc/homegear/homegear.csr
openssl x509 -req -in /etc/homegear/homegear.csr -signkey /etc/homegear/homegear.key -out /etc/homegear/homegear.crt
rm /etc/homegear/homegear.csr
chown homegear:homegear /etc/homegear/homegear.key
chmod 400 /etc/homegear/homegear.key
openssl dhparam -check -text -5 1024 -out /etc/homegear/dh1024.pem
chown homegear:homegear /etc/homegear/dh1024.pem
chmod 400 /etc/homegear/dh1024.pem