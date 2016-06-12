#!/bin/bash
emerge --ask app-i18n/fcitx app-i18n/fcitx-configtool

cp fcitx.xprofile /home/wilson/.xprofile && chown wilson:wilson /home/wilson/.xprofile
