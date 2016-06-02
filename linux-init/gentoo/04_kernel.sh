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
