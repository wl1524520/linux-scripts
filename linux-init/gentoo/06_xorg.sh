#!/bin/bash

# set package.use and profile
rm -rf /etc/portage/package.use
cp -r etc/portage/package.use /etc/portage/

emerge --ask --verbose x11-base/xorg-drivers
emerge --ask x11-base/xorg-server

echo 'RUN: env-update && source /etc/profile'
echo "It is wise to reboot system"
