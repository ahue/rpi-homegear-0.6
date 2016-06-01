#!/bin/sh

docker run  -ti \
            --rm \
            --name homegear \
            -v /etc/localtime:/etc/localtime:ro \
            -v `pwd`/etc:/opt/homegear/etc \
            patrickse/rpi-homegear:0.6
            
            