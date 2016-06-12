#!/bin/bash

cp etc/portage/package.accept_keywords /etc/portage/
emerge --ask sys-kernel/dracut
echo 'add_dracutmodules+="usrmount"' > /etc/dracut/dracut.conf

# btrfs filesystem support
emerge --ask sys-fs/btrfs-progs

emerge --ask sys-apps/pciutils
emerge --ask sys-kernel/gentoo-sources

#emerge --ask sys-kernel/genkernel
# Install genkernel for systemd
emerge --ask sys-kernel/genkernel-next
cat etc/genkernel.conf > /etc/genkernel.conf

# Kernel config file
cp kernel.config/latest.config /usr/src/linux/.config

# build and install linux kernel
cd /usr/src/linux && make && make modules_install && make install

# set efi boot
mkdir -p /boot/efi/boot
cp /boot/vmlinuz-* /boot/efi/boot/bootx64.efi

# Install initramfs
genkernel --install initramfs

