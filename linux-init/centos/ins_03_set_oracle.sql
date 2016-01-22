sqlplus / as sysdba
 SQL> shutdown immediate;
 SQL> startup mount
 SQL> alter database archivelog;
 SQL> alter database flashback on;
 SQL> alter database open;
 SQL> execute utl_recomp.recomp_serial();
 SQL> alter system archive log current;
 SQL> exit
