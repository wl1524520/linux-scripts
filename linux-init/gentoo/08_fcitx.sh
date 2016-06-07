#!/bin/bash
echo 'app-i18n/fcitx X table nls gtk3' > /etc/portage/package.use/fcitx
emerge --ask app-i18n/fcitx app-i18n/fcitx-configtool

cp fcitx.xprofile /home/wilson/.xprofile && chown wilson:wilson /home/wilson/.xprofile
