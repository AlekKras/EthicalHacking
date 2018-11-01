FROM ubuntu
LABEL Aleksandr Krasnov "alekforwork@gmail.com"
USER root
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install git -y && \
    apt-get install golang-go -y && \
    apt-get install  libpcap-dev -y && \
    apt-get install libnetfilter-queue-dev -y

COPY RUN_IT.sh RUN_IT.sh
