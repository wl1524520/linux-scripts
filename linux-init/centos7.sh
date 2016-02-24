#!/bin/bash
yum update -y
yum install -y wget net-tools git vim
yum remove -y system-config-kdump

echo -e "\nalias vi='vim'" >> /etc/profile
source /etc/profile
