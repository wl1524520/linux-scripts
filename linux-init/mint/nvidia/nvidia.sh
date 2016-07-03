#!/bin/bash

# http://sblackwell.com/blog/2014/08/installing-nvidia-drivers-on-lmde/

apt-get install nvidia-detect
nvidia-detect
apt-get install nvidia-vdpau-driver nvidia-driver nvidia-settings
inxi -SGx
