#!/bin/bash
yum update -y
yum install -y wget net-tools git vim
yum remove -y system-config-kdump

echo -e "\nalias vi='vim'" >> /etc/profile

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config 
