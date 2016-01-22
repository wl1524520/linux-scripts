#!/bin/bash
echo "Install Oracle Software Only"
echo "./runInstaller -silent -responseFile /path/to/db_install_swonly.rsp"
echo ""

echo "Finish Orcle Install"
echo "Run scripts below"
echo "/home/oracle/oraInventory/orainstRoot.sh"
echo "/home/oracle/oracle_base/product/11.2.0/dbhome_1/root.sh"
echo ""

echo "Install Oracle Listener"
echo "netca /silent /responsefile /home/oracle/response/netca.rsp"
echo ""

echo "Install Oracle Instance"
echo "dbca -silent -responseFile /path/to/dbca.rsp"
echo ""
