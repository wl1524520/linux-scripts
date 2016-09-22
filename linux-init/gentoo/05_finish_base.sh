#!/bin/bash

# config fstab
cat etc/fstab > /etc/fstab

# set hostname for systemd
echo "gentoo" > /etc/hostname
echo "127.0.0.1 gentoo.local gentoo" >> /etc/hosts

emerge --ask --noreplace net-misc/netifrc

# set hwclock
sed -i 's/clock="UTC"/clock="local"/g' /etc/conf.d/hwclock

# install some service
emerge --ask app-admin/syslog-ng
systemctl enable syslog-ng.service

# cron service (optional)
emerge --ask sys-process/cronie
systemctl enable cronie.service
crontab /etc/crontab

# File indexing 
emerge --ask sys-apps/mlocate

# remote access for systemd
systemctl enable sshd.service

# Install dhcp client
emerge --ask net-misc/dhcpcd
systemctl enable dhcpcd.service

# Install ntp
emerge --ask net-misc/ntp
systemctl enable ntpd.service

# set bootloader
emerge --ask sys-boot/grub:2
grub2-install /dev/sda
cat etc/default/grub > /etc/default/grub
grub2-mkconfig -o /boot/grub/grub.cfg

# some packages
emerge --ask \
    app-admin/sudo \
    app-editors/vim \
    app-shells/zsh \
    dev-vcs/git

# ping
chmod u+s /bin/ping

# set root password
passwd root
