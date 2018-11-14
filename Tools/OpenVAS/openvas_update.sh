#!/bin/bash

echo "Updating OpenVAS Service ..."

openvas-nvt-sync
openvas-scapdata-sync
openvas-certdata-sync

echo "Updating ports ..."

wget -q http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml -O /tmp/ports.xml
openvas-portnames-update /tmp/ports.xml
