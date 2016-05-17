#!/bin/bash

############################################
# ssh OpenVPN ntp icmp mysql ddos
############################################
#SERVER_IP="xxx.xxx.xxx.xxx"
SERVER_IP="123.57.66.95"
SERVER_DEV="eth1"
VPN_NET="10.8.0.0/24"

function echo_red()
{
    echo -e "\033[31m$*\033[0m"
    #echo -ne "\033[31m"
    #echo $1
    #echo -ne "\033[0m"
}

# Get Server's public ip
function get_server_ip()
{
    ip=`curl ifconfig.me 2> /dev/null`
    if [ $? -eq 0 ]; then
        SERVER_IP=$ip
    else
        SERVER_IP=""
    fi
}

if [ -z "$SERVER_IP" ]; then
    echo_red "Variable SERVER_IP is null, Please set it first !"
    exit 1
fi

echo $SERVER_IP

# Flush all rules
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -X
sudo iptables -t nat -X

# If a pre-existing connection exists, allow it
sudo iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p udp -m state --state RELATED,ESTABLISHED -j ACCEPT

# Setup bi-directional ping for this hosts internal address
# icmp-type: echo-reply=0  echo-request=8
sudo iptables -A INPUT  -p icmp --icmp-type 8 -s 0/0 -d $SERVER_IP -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -p icmp --icmp-type 0 -s $SERVER_IP -d 0/0 -m state --state ESTABLISHED,RELATED     -j ACCEPT
sudo iptables -A OUTPUT -p icmp --icmp-type 8 -s $SERVER_IP -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT  -p icmp --icmp-type 0 -s 0/0 -d $SERVER_IP -m state --state ESTABLISHED,RELATED     -j ACCEPT

# Accept and send all traffic on the loopback network adapter
sudo iptables -A INPUT  -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Accept and send all OpenVPN traffic on the VPN network adapter
#sudo iptables -A INPUT  -i tun0 -j ACCEPT
#sudo iptables -A OUTPUT -o tun0 -j ACCEPT

# Allow OpenVPN to connect and setup tunnel
#sudo iptables -A INPUT  -i $SERVER_DEV -p tcp -m tcp --dport 1194 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o $SERVER_DEV -p tcp -m tcp --sport 1194 -m state --state NEW,ESTABLISHED -j ACCEPT

# Add iptables-rule to forward a routing to openvpn subnet.
#sudo iptables -t nat -A POSTROUTING -s $VPN_NET -o $SERVER_DEV -j MASQUERADE

# Comment the following out to prevent access via ssh on the external network adapter once VPN is running 
# and has auto-started after a reboot
#sudo iptables -A INPUT  -i eth1 -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -o eth1 -p tcp -m tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT

# Allow ssh
# incomming rules
sudo iptables -A INPUT  -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT
# outcomming rules
sudo iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT

# incomming rules
sudo iptables -A INPUT  -p tcp --dport 8022 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 8022 -m state --state ESTABLISHED     -j ACCEPT
# outcomming rules
sudo iptables -A OUTPUT -p tcp --dport 8022 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 8022 -m state --state ESTABLISHED     -j ACCEPT

# Allow dns to work
sudo iptables -A OUTPUT -p udp --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow http
sudo iptables -A INPUT  -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 80 -m state --state ESTABLISHED     -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 80 -m state --state ESTABLISHED     -j ACCEPT

# Allow https
sudo iptables -A INPUT  -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED     -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 443 -m state --state ESTABLISHED     -j ACCEPT

# Allow ntp to work
sudo iptables -A OUTPUT -p udp --sport 1024:65535 --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT

# avoid ddos attack
sudo iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT

# Allow access to PostgresSQL from a specific client on the internal network
# CLIENT_IP="192.168.165.14"
# sudo iptables -A INPUT -p tcp -s $CLIENT_IP --dport 5432 -m state --state NEW,ESTABLISHED -j ACCEPT
# sudo iptables -A OUTPUT -p tcp -d $CLIENT_IP --sport 5432 -m state --state ESTABLISHED -j ACCEPT

# Allow access to MySQL from the internal network
sudo iptables -A INPUT  -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED     -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT  -p tcp --sport 3306 -m state --state ESTABLISHED     -j ACCEPT

# sendmail service
#sudo iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT
#sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SMTP Port
sudo iptables -A INPUT  -p tcp --dport 465 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 465 -j ACCEPT

# Allow 192.168.42.0/24 访问
sudo iptables -A INPUT -s 192.168.42.0/24 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.42.0/24 -j ACCEPT

# Drop everything that doesn't match the above
sudo iptables -A INPUT   -j DROP
sudo iptables -A FORWARD -j DROP

# Default Policy rules
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
