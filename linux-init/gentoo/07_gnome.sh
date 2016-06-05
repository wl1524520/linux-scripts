#!/bin/bash

# Install gnome3
emerge --ask gnome-base/gnome

# update env
env-update && source /etc/profile

# Install cinnamon
emerge --ask gnome-extra/cinnamon
emerge --ask elementary-xfce-icon-theme

systemctl disable dhcpcd.service
systemctl enable NetworkManager

# Install Google Noto Fonts
emerge --ask media-fonts/noto

useradd -m wilson
passwd wilson
gpasswd -a wilson wheel
gpasswd -a wilson audio
gpasswd -a wilson cdrom
gpasswd -a wilson video
gpasswd -a wilson usb
gpasswd -a wilson portage
gpasswd -a wilson plugdev
