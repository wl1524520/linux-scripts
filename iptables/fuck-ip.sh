#!/bin/bash

# 封杀一个IP
sudo iptables -I INPUT -s 117.26.117.132 -j DROP
# 解封一个IP
#sudo iptables -D INPUT -s 117.26.117.132 -j DROP
