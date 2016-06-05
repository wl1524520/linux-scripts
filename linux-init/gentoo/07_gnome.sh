#!/bin/bash

# Install gnome3
emerge --ask gnome-base/gnome

# Install cinnamon
emerge --ask gnome-extra/cinnamon

# Install Google Noto Fonts
emerge --ask media-fonts/noto

echo 'RUN: env-update && source /etc/profile'

