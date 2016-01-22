#!/bin/bash

# CentOS 6.x x86_64
yum install -y setuptool system-config-network-tui
yum install -y system-config-firewall-base system-config-firewall system-config-firewall-tui

yum install -y binutils
yum install -y compat-libcap1
yum install -y gcc
yum install -y gcc-c++
yum install -y ksh
yum install -y make
yum install -y sysstat
yum install -y glibc.i686 glibc.x86_64
yum install -y compat-libstdc++-33.x86_64
yum install -y compat-libstdc++-33.i686
yum install -y glibc-devel.i686 glibc-devel.x86_64
yum install -y libgcc.i686 libgcc.x86_64
yum install -y libstdc++.i686 libstdc++.x86_64
yum install -y libstdc++-devel.i686 libstdc++-devel.x86_64
yum install -y libaio.i686 libaio.x86_64
yum install -y libaio-devel.i686 libaio-devel.x86_64
yum install -y elfutils-libelf-devel

yum install -y unixODBC-devel.i686 unixODBC-devel.x86_64
yum install -y unixODBC.i686 unixODBC.x86_64

#yum localinstall -y rpm/pdksh-5.2.14-37.el5_8.1.x86_64.rpm

echo "Install Base Package Success"

groupadd oinstall
groupadd dba
useradd -g oinstall -G dba -d /home/oracle oracle
passwd oracle

echo "set oracle user success"

mkdir -p /home/oracle/oracle_base
mkdir -p /home/oracle/oracle_base/product/11.2.0/dbhome_1   #数据库系统安装目录
mkdir -p /home/oracle/oracle_base/oradata    #数据库数据安装目录
mkdir -p /home/oracle/oracle_base/flash_recovery_area   #数据备份目录
mkdir -p /home/oracle/oraInventory #清单目录
chown -R oracle:oinstall /home/oracle/oracle_base
chown -R oracle:oinstall /home/oracle/oraInventory
chmod -R 775 /home/oracle/oracle_base

echo "set directory"

echo "127.0.0.1 `hostname`" >> /etc/hosts

cat conf/set_kernel.conf >> /etc/sysctl.conf
modprobe bridge
/sbin/sysctl -p

cat conf/set_limits.conf >> /etc/security/limits.conf
cat conf/set_pam_login.conf >> /etc/pam.d/login
cat conf/set_profile.sh >> /etc/profile
cat conf/set_oracle_profile.sh >> /home/oracle/.bashrc

chkconfig iptables off

echo "config success, please reboot system and instll oracle"

