#!/bin/bash

# set timezone
echo "Asia/Shanghai" > /etc/timezone
emerge --config sys-libs/timezone-data

cat etc/locale.gen > /etc/locale.gen
locale-gen

eselect locale list
echo "RUN: eselect locale set <num>"

echo ""
echo 'RUN: env-update && source /etc/profile && export PS1="(chroot) $PS1"'
echo ""
