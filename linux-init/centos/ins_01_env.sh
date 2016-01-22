#!/bin/bash
# CentOS 6.x x86_64
yum install -y binutils compat-libcap1 gcc gcc-c++ ksh make sysstat glibc.i686 glibc.x86_64 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 glibc-devel.i686 glibc-devel.x86_64 libgcc.i686 libgcc.x86_64 libstdc++.i686 libstdc++.x86_64 libstdc++-devel.i686 libstdc++-devel.x86_64 libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 elfutils-libelf-devel unixODBC.i686 unixODBC.x86_64 unixODBC-devel.i686 unixODBC-devel.x86_64
echo "Install Base Package Success"
echo ""

groupadd oinstall
groupadd dba
useradd -g oinstall -G dba -d /home/oracle oracle
passwd oracle
echo "Set Oracle User Success"
echo ""

mkdir -p /home/oracle/oracle_base
mkdir -p /home/oracle/oracle_base/product/11.2.0/dbhome_1   #数据库系统安装目录
mkdir -p /home/oracle/oracle_base/oradata    #数据库数据安装目录
mkdir -p /home/oracle/oracle_base/flash_recovery_area   #数据备份目录
mkdir -p /home/oracle/oraInventory #清单目录
chown -R oracle:oinstall /home/oracle/oracle_base
chown -R oracle:oinstall /home/oracle/oraInventory
chmod -R 775 /home/oracle/oracle_base
echo "Set Oracle Directory"
echo ""

echo "127.0.0.1 `hostname`" >> /etc/hosts
echo "Set hostname"
echo ""

cat conf/set_kernel.conf >> /etc/sysctl.conf
modprobe bridge
/sbin/sysctl -p
echo "Set Kernel"
echo ""

cat conf/set_limits.conf >> /etc/security/limits.conf
cat conf/set_pam_login.conf >> /etc/pam.d/login
echo "Set limits and pam_login"
echo ""

cat conf/set_profile.sh >> /etc/profile
cat conf/set_oracle_profile.sh >> /home/oracle/.bashrc
echo "Set profile and oracle profile"
echo ""

chkconfig iptables off
echo "Disable iptables"
echo ""

echo "Config success, please reboot system and instll oracle"
