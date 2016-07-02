#!/bin/bash

##########################################
# Deepin 2015 install fcitx script       #
##########################################

# update first
sudo apt-get update

# Install Fcitx
sudo apt-get -y install \
    fcitx \
    fcitx-bin \
    fcitx-config-common \
    fcitx-config-gtk \
    fcitx-data \
    fcitx-frontend-gtk2 \
    fcitx-frontend-gtk3 \
    fcitx-frontend-qt4 \
    fcitx-frontend-qt5 \
    fcitx-libs \
    fcitx-modules \
    fcitx-module-dbus \
    fcitx-module-kimpanel \
    fcitx-module-lua \
    fcitx-module-x11 \
    fcitx-table \
    fcitx-table-wbpy \
    fcitx-googlepinyin \
    fcitx-sogoupinyin-uk \
    libfcitx-config4 \
    libfcitx-core0 \
    libfcitx-gclient0 \
    libfcitx-qt0 \
    libfcitx-qt5-1 \
    libfcitx-utils0
