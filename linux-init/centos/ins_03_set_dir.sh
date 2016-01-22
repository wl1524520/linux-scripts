mkdir -p /home/oracle/oracle_base
mkdir -p /home/oracle/oracle_base/product/11.2.0/dbhome_1   #数据库系统安装目录
mkdir -p /home/oracle/oracle_base/oradata    #数据库数据安装目录
mkdir -p /home/oracle/oracle_base/flash_recovery_area   #数据备份目录
mkdir -p /home/oracle/oraInventory #清单目录
chown -R oracle:oinstall /home/oracle/oracle_base
chown -R oracle:oinstall /home/oracle/oraInventory
chmod -R 775 /home/oracle/oracle_base
