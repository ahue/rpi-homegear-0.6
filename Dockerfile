FROM resin/rpi-raspbian:jessie

RUN apt-get update \ 
    && apt-get -y install wget apt-transport-https ca-certificates \
    && wget https://homegear.eu/packages/Release.key \
    && apt-key add Release.key \
    && rm Release.key \
    && echo 'deb https://homegear.eu/packages/Raspbian/ jessie/' >> /etc/apt/sources.list.d/homegear.list \ 
    && apt-get update \
    && apt-get install -y \
        homegear \
        homegear-homematicbidcos \
        homegear-homematicwired \
        homegear-insteon \
        homegear-max \
        homegear-philipshue \
        homegear-sonos \
    && mkdir -p /opt/homegear/etc \
    && chown -R homegear.homegear /opt/homegear

VOLUME /opt/homegear/etc
VOLUME /var/lib/homegear

ADD data/start.sh /opt/homegear/start.sh
ADD data/createCerts.sh /opt/homegear/createCerts.sh

CMD ["bash","/opt/homegear/start.sh"]