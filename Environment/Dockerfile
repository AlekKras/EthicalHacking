FROM ubuntu
LABEL Aleksandr Krasnov "alekforwork@gmail.com"
USER root

RUN apt-get update && apt-get install -y git nmap tor proxychains dirb wget nikto skipfish  && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
