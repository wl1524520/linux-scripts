#!/bin/bash

groupadd oinstall
groupadd dba
useradd -g oinstall -G dba -d /home/oracle oracle
passwd oracle
