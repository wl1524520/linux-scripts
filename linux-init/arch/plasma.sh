#!/bin/bash

useradd -m -g users -G wheel -s /bin/bash wanglu
passwd wanglu

pacman -Syu
pacman -S xorg xorg-xinit plasma-meta konsole sddm sudo ttf-freefont ttf-liberation
systemctl enable sddm
cp sddm.conf /etc/
