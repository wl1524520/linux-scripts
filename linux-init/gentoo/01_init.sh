#!/bin/bash

# format partitions
mkfs.ext2 /dev/sda2
mkfs.ext4 /dev/sda4
mkswap /dev/sda3

# enable swap
swapon /dev/sda3

# mount
mkdir /mnt/gentoo/boot
mount /dev/sda4 /mnt/gentoo
mount /dev/sda2 /mnt/gentoo/boot

# set date
date 060316232016

# copy stage tarball
wget http://mirrors.aliyun.com/gentoo/releases/amd64/autobuilds/20160528/systemd/stage3-amd64-systemd-20160528.tar.bz2
tar jxvpf stage3-amd64-systemd-20160528.tar.bz2 --xattrs -C /mnt/gentoo

# set portage
cat etc/portage/make.conf > /mnt/gentoo/etc/portage/make.conf
cp -r etc/portage/repos.conf /mnt/gentoo/etc/portage
cp -L /etc/resolv.conf /mnt/gentoo/etc/
cp etc/portage/package.use/* /mnt/gentoo/etc/portage/package.use/
cp etc/portage/package.accept_keywords /mnt/gentoo/etc/portage
cp etc/profile.d/alias.sh /mnt/gentoo/etc/profile.d

# mount
mount -t proc proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

echo ""
echo "RUN: chroot /mnt/gentoo /bin/bash"
echo ""
