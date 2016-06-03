#!/bin/bash

# Copy config files from /opt/homegear/etc to /etc/homegear and overwrite defaults
echo "Copy configuration"

DIR="/opt/homegear/etc"

if [ "$(ls -A $DIR)" ]; then

    echo "Configs will be copied"
    cp -R /opt/homegear/etc/* /etc/homegear
    
    chown homegear.homegear \
        /etc/homegear/dh1024.pem \
        /etc/homegear/homegear.key \
        /etc/homegear/rpcclients.conf \
        /var/lib/homegear/db.sql 
    
    sudo -u homegear homegear

else

    echo "Bootstrapping environment"
    echo "-------------------------"
    echo "1) Preparing Certificates"
    
    bash /opt/homegear/createCerts.sh
    
    echo 
    echo "2) Copy Configuration"
    
    cp -R /etc/homegear/* /opt/homegear/etc/ 

    echo 
    echo "Please review the configuration"

fi