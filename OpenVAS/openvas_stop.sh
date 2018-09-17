#!/bin/bash

echo "Stopping OpenVAS Service..."

service greenbone-security-assistant stop
service openvas-scanner stop
service openvas-manager stop
