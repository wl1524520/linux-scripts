#!/bin/bash

echo "Asia/Shanghai" > /etc/timezone
emerge --config sys-libs/timezone-data

cat etc/locale.gen > /etc/locale.gen
locale-gen

echo 'RUN: env-update && source /etc/profile && export PS1="(chroot) $PS1"'
