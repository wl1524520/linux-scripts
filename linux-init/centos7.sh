#!/bin/bash
yum update -y
yum install -y wget net-tools git vim
yum remove -y system-config-kdump

yum install -y bash-completion

#echo -e "\nalias vi='vim'" >> /etc/profile

#sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config 

# replace firewalld with iptables
systemctl stop firewalld
systemctl disable firewalld
yum install -y iptables-services && systemctl enable iptables && systemctl start iptables
