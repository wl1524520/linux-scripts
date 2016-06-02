#!/bin/bash

emerge --ask sys-apps/pciutils
emerge --ask sys-kernel/gentoo-sources
cp gentoo.config /usr/src/linux/.config

echo "make && make modules_install && make install"

echo "mkdir -p /boot/efi/boot"
echo "cp /boot/vmlinuz-* /boot/efi/boot/bootx64.efi"

#emerge --ask sys-kernel/genkernel
emerge --ask sys-kernel/genkernel-next
genkernel --install initramfs

cat etc/fstab > /etc/fstab
echo "gentoo" > /etc/hostname

emerge --ask --noreplace net-misc/netifrc

# install some service
emerge --ask app-admin/sysklogd
rc-update add sysklogd default

emerge --ask sys-process/cronie
rc-update add cronie default
crontab /etc/crontab

emerge --ask sys-apps/mlocate
rc-update add sshd default

emerge --ask net-misc/dhcpcd

emerge --ask sys-boot/grub:2
grub2-install /dev/sda
grub2-mkconfig -o /boot/grub/grub.cfg
