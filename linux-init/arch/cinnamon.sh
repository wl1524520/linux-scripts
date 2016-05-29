#!/bin/bash

pacman -Syu
pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils mesa
pacman -S xorg-twm xterm xorg-xclock
pacman -S xf86-input-synaptics

# Graphics Driver
pacman -S xf86-video-vesa
pacman -S xf86-video-nouveau

# Install Cinnamon
pacman -S cinnamon nemo-fileroller
pacman -S gdm

# enable gdm
systemctl enable gdm

# Install Basic Softwares
pacman -S pulseaudio pulseaudio-alsa pavucontrol gnome-terminal firefox flashplugin vlc chromium unzip unrar p7zip pidgin skype deluge smplayer audacious qmmp gimp xfburn thunderbird gedit gnome-system-monitor

# Codecs
pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins

# Customize Cinnamon Desktop
pacman -S Faenza-icon-theme numix-themes
