#!/bin/bash

##########################################
# Linux Mint and LMDE init scripts       #
##########################################

# uninstall some unuseful packages
sudo apt-get -y purge pidgin*
sudo apt-get -y purge thunderbird*
sudo apt-get -y purge hexchat*
sudo apt-get -y purge tomboy
sudo apt-get -y purge transmission*
sudo apt-get -y purge brasero*
sudo apt-get -y purge simple-scan
sudo apt-get -y purge gnome-orca
sudo apt-get -y autoremove
