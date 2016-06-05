#!/bin/bash

# Install gnome3
emerge --ask gnome-base/gnome

# update env
env-update && source /etc/profile

# Install cinnamon
emerge --ask gnome-extra/cinnamon

# Troubleshooting
emerge --ask gnome-extra/gnome-tweak-tool
emerge --ask gnome-extra/gnome-shell-extensions

# Install Google Noto Fonts
emerge --ask media-fonts/noto

