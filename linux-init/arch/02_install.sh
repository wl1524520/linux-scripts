# start install
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# set locale environment
cat /root/locale.gen > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# install kernel
mkinitcpio -p linux

# set root password
echo 'root:www.wanglu.info' | chpasswd

# set hostname
echo 'arch' > /etc/hostname

# install bootloader
pacman -Sy grub && grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg

# install some packages
pacman -Sy vim openssh sudo

# enable service
systemctl enable sshd.service

# set internet dhcp
cp /root/ethernet-dhcp /etc/netctl/enp0s3
