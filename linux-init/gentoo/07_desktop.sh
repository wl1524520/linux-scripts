#!/bin/bash

# Install gtk+extra
emerge --ask x11-libs/gtk+extra
env-update && source /etc/profile

# Install cinnamon
emerge --ask gnome-extra/cinnamon

# Install GDM
emerge --ask gnome-base/gdm
systemctl enable gdm.service

# enable network for systemd
systemctl disable dhcpcd.service
systemctl enable NetworkManager

# enable print service
systemctl enable cups.service

# Install Fonts
emerge --ask media-fonts/noto
emerge --ask \
    media-fonts/arphicfonts \
    media-fonts/bitstream-cyberbit \
    media-fonts/droid \
    media-fonts/ipamonafont \
    media-fonts/ja-ipafonts \
    media-fonts/takao-fonts \
    media-fonts/wqy-microhei \
    media-fonts/wqy-zenhei


# Install Firefox
emerge --ask firefox

# Install backgrounds
emerge --ask gnome-backgrounds

exit

# add a normal user
useradd -m wilson
gpasswd -a wilson wheel
gpasswd -a wilson audio
gpasswd -a wilson cdrom
gpasswd -a wilson video
gpasswd -a wilson usb
gpasswd -a wilson plugdev
#echo 'wilson:www.wanglu.info' | chpasswd
passwd wilson
