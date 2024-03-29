#!/bin/bash

# 封杀一个IP
sudo iptables -I INPUT -s 117.26.117.132 -j DROP
# 解封一个IP
#sudo iptables -D INPUT -s 117.26.117.132 -j DROP

# 禁止 MAC地址 58:03:fb:ce:44:3f 访问外网
iptables -I FORWARD  -m mac --mac-source 58:03:fb:ce:44:3f -j DROP

