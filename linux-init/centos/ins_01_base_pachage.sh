#!/bin/bash

# CentOS 6.x x86_64

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
