# Homegear for Docker Raspberry Pi

Docker image with current Homegear 0.6 inside. It´s based on
`resin/rpi-raspbian:jessie` and the offical debian package
from homegear.eu.

Please have a look at http://www.homegear.eu.

# Getting started

I´ve created a few convenience scripts to get things going. Just run `build.sh` to build the image
from the Dockerfile.

Afterwards you can run the container with the `run.sh` command. To enter the homegear shell, just run
`enter.sh`. That´s it. 

**Keep in mind, these scripts are just for quick testing**