#!/bin/bash

emerge --ask x11-libs/gtk+extra
emerge --ask gnome-extra/cinnamon

emerge --ask gnome-base/gdm
systemctl enable gdm.service
