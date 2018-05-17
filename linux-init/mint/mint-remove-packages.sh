#!/bin/bash

##########################################
# Linux Mint and LMDE init scripts       #
##########################################

# uninstall some unuseful packages
sudo apt-get -y purge pidgin* \
                    thunderbird* \
                    hexchat* \
                    tomboy \
                    transmission* \
                    brasero* \
                    simple-scan \
                    gnome-orca

# Uninstall dmraid
sudo apt-get -y purge dmraid

sudo apt-get -y autoremove
