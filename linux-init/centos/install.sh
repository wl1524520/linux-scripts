#!/bin/bash
#yum install gcc gcc-c++ make binutils compat-libstdc++-33 elfutils-libelf-devel elfutils-libelf-devel-static ksh libaio libaio-devel numactl-devel sysstat unixODBC unixODBC-devel pcre-devel

groupadd oinstall
groupadd dba
useradd -g oinstall -G dba -d /home/oracle oracle
passwd oracle
