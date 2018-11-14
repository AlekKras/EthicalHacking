#!/bin/bash

sudo add-apt-repository ppa:mrazavi/openvas
sudo apt update -y
sudo apt install sqlite3 -y
sudo apt install openvas9 -y

sudo apt install texlive-latex-extra --no-install-recommends -y
sudo apt-get install texlive-fonts-recommended -y

sudo apt install libopenvas9-dev
sudo greenbone-nvt-sync
sudo greenbone-scapdata-sync
sudo greenbone-certdata-sync

service openvas-scanner restart

# OPTOINAL:
# For testing windows servers
# sudo apt install smbclient -y

# Any problems you might have, refer to those:
# /var/log/openvas
# /var/log/openvas/gsad.log
# /var/log/openvas/openvasmd.log
# /var/log/openvas/openvassd.dump
# /var/log/openvas/openvassd.messages
