#!/bin/bash

# download fonts
wget -O /tmp/wps-symbol-fonts.tar.gz http://cdn.uniteyun.com/fonts/wps-symbol-fonts.tar.gz
wget -O /tmp/wps-office-fonts.tar.gz http://cdn.uniteyun.com/fonts/wps-office-fonts.tar.gz

# uncompress tarball
tar zxvf /tmp/wps-symbol-fonts.tar.gz -C /tmp
tar zxvf /tmp/wps-office-fonts.tar.gz -C /tmp

# copy fonts file to /usr/share/fonts/ directory
sudo cp -r /tmp/wps-symbol-fonts /usr/share/fonts/ && sudo chown -R root:root /usr/share/fonts/wps-symbol-fonts && echo "copy wps-symbol-fonts to /usr/share/fonts/ success"
sudo cp -r /tmp/wps-office-fonts /usr/share/fonts/ && sudo chown -R root:root /usr/share/fonts/wps-office-fonts && echo "copy wps-office-fonts to /usr/share/fonts/ success"

# change file mode
sudo chmod 755 /usr/share/fonts/wps-symbol-fonts
sudo chmod 644 /usr/share/fonts/wps-symbol-fonts/*
cd /usr/share/fonts/wps-symbol-fonts/ && sudo mkfontdir && sudo mkfontscale && sudo fc-cache

sudo chmod 755 /usr/share/fonts/wps-office-fonts
sudo chmod 644 /usr/share/fonts/wps-office-fonts/*
cd /usr/share/fonts/wps-office-fonts/ && sudo mkfontdir && sudo mkfontscale && sudo fc-cache

echo "Install WPS Fonts Success, Enjoy !"
