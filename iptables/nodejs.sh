#!/bin/bash

# incomming rules
sudo iptables -A INPUT  -p tcp --dport 8122 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 8122 -m state --state ESTABLISHED     -j ACCEPT
# outcomming rules
sudo iptables -A OUTPUT -p tcp --dport 8122 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 8122 -m state --state ESTABLISHED     -j ACCEPT

# incomming rules
sudo iptables -A INPUT  -p tcp --dport 3000 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 3000 -m state --state ESTABLISHED     -j ACCEPT
# outcomming rules
sudo iptables -A OUTPUT -p tcp --dport 3000 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 3000 -m state --state ESTABLISHED     -j ACCEPT
