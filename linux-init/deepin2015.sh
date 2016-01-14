#!/bin/bash

##########################################
# Deepin 2015 init script                #
##########################################

# update first
sudo apt-get update && sudo apt-get dist-upgrade -y

# Install some tools
sudo apt-get -y install git filezilla vlc

# Install vim and config it
sudo apt-get -y install vim
cat ../vimrcs/vimrc.vim > ~/.vimrc

# Install fonts
sudo apt-get -y install fonts-noto* fonts-wqy*

# Install vpn client
#sudo apt-get install network-manager-openvpn network-manager-openvpn-gnome network-manager-pptp network-manager-pptp-gnome

# Install Fcitx with wubi and googlepinyin
sudo apt-get -y install fcitx fcitx-table-wbpy fcitx-table-wubi fcitx-googlepinyin

# Install GIMP
sudo apt-get -y install gimp gimp-data gimp-data-extras gimp-ufraw gimp-dcraw

# Install zsh shell
sudo apt-get -y install zsh && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
