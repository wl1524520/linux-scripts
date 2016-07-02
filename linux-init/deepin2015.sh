#!/bin/bash

##########################################
# Deepin 2015 init script                #
##########################################

# update first
sudo apt-get update && sudo apt-get dist-upgrade -y

# Install some tools
sudo apt-get -y install git vlc

# Install fonts
#sudo apt-get -y install fonts-noto* fonts-wqy*

# Install vpn client
#sudo apt-get install network-manager-openvpn network-manager-openvpn-gnome network-manager-pptp network-manager-pptp-gnome

# Install Fcitx with wubi and googlepinyin
#sudo apt-get -y install fcitx fcitx-table-wbpy fcitx-table-wubi fcitx-googlepinyin
sudo apt-get -y install fcitx fcitx-bin fcitx-config-common fcitx-config-gtk fcitx-data fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-frontend-qt5 fcitx-libs fcitx-module-dbus fcitx-module-kimpanel fcitx-module-lua fcitx-module-x11 fcitx-modules fcitx-sogoupinyin-uk fcitx-table fcitx-table-wbpy libfcitx-config4 libfcitx-core0 libfcitx-gclient0 libfcitx-qt0 libfcitx-qt5-1 libfcitx-utils0

# Install GIMP
sudo apt-get -y install gimp gimp-data gimp-data-extras gimp-ufraw gimp-dcraw
