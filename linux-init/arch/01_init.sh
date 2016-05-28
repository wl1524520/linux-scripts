#!/bin/bash
parted -a optimal /dev/sda mklabel gpt
parted -a optimal /dev/sda unit mib

# sda1 bios_grub
parted -a optimal /dev/sda mkpart primary 1 3
parted -a optimal /dev/sda name 1 grub
parted -a optimal /dev/sda set 1 bios_grub on

# sda2 boot
parted -a optimal /dev/sda mkpart primary 3 515
parted -a optimal /dev/sda name 2 boot
parted -a optimal /dev/sda set 2 boot on

# sda3 swap
parted -a optimal /dev/sda mkpart primary 515 1539
parted -a optimal /dev/sda name 3 swap

# sda4 rootfs
parted -a optimal /dev/sda "mkpart primary 1539 -1"
parted -a optimal /dev/sda name 4 rootfs

# format
mkfs.ext2 /dev/sda2
mkfs.ext4 /dev/sda4
mkswap /dev/sda3
swapon /dev/sda3

# mount
mount /dev/sda4 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

# set mirrors
cat mirrorlist > /etc/pacman.d/mirrorlist
# update database
pacman -Syy

# install base system
pacstrap /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab

# prepare chroot
cp 02_install.sh /mnt/root/
cp locale.gen /mnt/root/
cp ethernet-dhcp /mnt/root/
cp ethernet-static /mnt/root/
echo 'run "arch-chroot /mnt /bin/bash"'
