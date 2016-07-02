#!/bin/bash

##########################################
# Deepin 2015 init script                #
##########################################

# update first
sudo apt-get update

# Install some tools
sudo apt-get -y install vlc

# Install fonts
sudo apt-get -y install \
    fonts-noto* fonts-roboto* \
    fonts-wqy* \
    fonts-droid fonts-droid-fallback \
    fonts-adobe-source-han-sans-cn


# Install vpn client
#sudo apt-get install network-manager-openvpn network-manager-openvpn-gnome network-manager-pptp network-manager-pptp-gnome

# Install GIMP
sudo apt-get -y install gimp gimp-data gimp-data-extras gimp-ufraw gimp-dcraw
