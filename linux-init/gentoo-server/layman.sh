#!/bin/bash

# Install layman
emerge --ask app-portage/layman

# config
echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf

# list sources
layman -L

# add gentoo-zh source
layman -a gentoo-zh
