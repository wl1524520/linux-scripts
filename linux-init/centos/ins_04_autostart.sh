#!/bin/bash

if [ ! -f /etc/init.d/oracle ] 
then 
    cp oracle /etc/init.d/oracle
    echo "Install Oracle Auto Start Script" 
fi 

chmod 755 /etc/init.d/oracle
chkconfig --level 35 oracle on

ln -s /etc/init.d/oracle /etc/rc0.d/K01oracle
ln -s /etc/init.d/oracle /etc/rc6.d/K01oracle
