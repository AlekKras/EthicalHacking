#!/bin/bash
echo "Starting OpenVAS Service..."

service greenbone-security-assistant start
service openvas-scanner start
service openvas-manager start
