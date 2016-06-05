#!/bin/bash

read -p "Please Input Current Date like MMDDhhmmYYYY : " current_date
echo $current_date

# set date
date $current_date
if [ $? -ne 0 ]; then
    echo "set date failed"
    exit
fi

# format partitions
mkfs.ext2 /dev/sda2
mkfs.ext4 /dev/sda4
mkswap /dev/sda3

# enable swap
swapon /dev/sda3

# mount
mount /dev/sda4 /mnt/gentoo
mkdir /mnt/gentoo/boot
mount /dev/sda2 /mnt/gentoo/boot

# copy stage tarball
wget http://mirrors.aliyun.com/gentoo/releases/amd64/autobuilds/20160528/systemd/stage3-amd64-systemd-20160528.tar.bz2
tar jxvpf stage3-amd64-systemd-20160528.tar.bz2 --xattrs -C /mnt/gentoo

# set portage
cat etc/portage/make.conf > /mnt/gentoo/etc/portage/make.conf
cp -r etc/portage/repos.conf /mnt/gentoo/etc/portage
cp -L /etc/resolv.conf /mnt/gentoo/etc/

# mount
mount -t proc proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

# copy scripts
cp -r ../gentoo /mnt/gentoo/root

echo ""
echo "RUN: chroot /mnt/gentoo /bin/bash"
echo "RUN: source /etc/profile"
echo 'RUN: PS1="(chroot) $PS1"'
echo ""
