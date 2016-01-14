#!/bin/bash

##########################################
# Linux Mint and LMDE init scripts       #
##########################################

# update first
# sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get update

# Install some tools
sudo apt-get -y install git filezilla vlc

# Install vim and config it
sudo apt-get -y install vim
cat ../../vimrcs/vimrc.vim > ~/.vimrc

# Install fonts
# sudo apt-get -y install fonts-noto* fonts-wqy* fonts-droid

# Install vpn client
sudo apt-get -y install network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome network-manager-pptp network-manager-pptp-gnome

# Config libreoffice
# sudo apt-get -y install libreoffice libreoffice-l10n-zh-cn

# Install MySQL Workbentch
sudo apt-get -y install mysql-workbench mysql-workbench-data

# Install zsh shell
sudo apt-get -y install zsh && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "setopt no_nomatch" >> ~/.zshrc
