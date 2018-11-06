FROM ubuntu
LABEL Aleksandr Krasnov "alekforwork@gmail.com"
USER root

RUN apt-get update && apt-get install -y git && \
    apt-get install -y nmap && apt-get install -y tor && \
    apt-get install -y  proxychains && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
