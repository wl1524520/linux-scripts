#!/bin/bash
echo "Install Oracle Software Only"
echo "./runInstaller -silent -responseFile /path/to/db_install_swonly.rsp"
echo ""

#要运行的 Root 脚本
echo "Finish Orcle Install"
echo "Run scripts below"
echo "/home/oracle/oraInventory/orainstRoot.sh"
echo "/home/oracle/oracle_base/product/11.2.0/dbhome_1/root.sh"
echo ""

echo "Install Oracle Listener"
echo "netca /silent /responsefile /home/oracle/response/netca.rsp"
#echo "/opt/oracle/11.2.0/bin/lsnrctl start LISTENER"
echo ""

echo "Install Oracle Instance"
echo "dbca -silent -responseFile /path/to/dbca.rsp"
echo ""
