#!/bin/bash

apt-get install -y curl
wget -O /tmp/graylog2.deb https://packages.graylog2.org/releases/graylog2-omnibus/ubuntu/graylog2_0.92.1-1_amd64.deb
dpkg -i /tmp/graylog2.deb
rm /tmp/graylog2.deb
