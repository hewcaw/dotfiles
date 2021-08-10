#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./config.sh
source ../utils.sh

# Set up Arch linux.
# mount $ROOT_PART /mnt
# mount $HOME_PART /mnt/home
# pacstrap /mnt base linux linux-firmware
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt

echo_indicator "Timezone ..." "Setting up"
# timedatectl list-timezones    # find the timezone
timedatectl set-timezone Asia/Ho_Chi_Minh >/dev/null
hwclock --systohc >/dev/null

echo_indicator "Localization ..." "Setting up"
# locale-gen
# echo LANG=en_US.UTF-8 > /etc/locale.conf
# export LANG=en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen >/dev/null

echo_indicator "Network ..." "Configuring"
echo $HOST_NAME > /etc/hostname
echo -e "127.0.0.1\tlocalhost\n\
         ::1\t\tlocalhost\n\
         127.0.1.1\t$HOST_NAME.localdomain $HOST_NAME" > /etc/hosts

echo_indicator "root password ..." "Setting up"
echo -e "Ay\nAy" | passwd >/dev/null

echo_indicator "Network Manager ..." "Setting up"
pacman --noconfirm --needed -S networkmanager >/dev/null
systemctl enable NetworkManager >/dev/null

echo_indicator "Swap file ..." "Setting up"
# sudo fallocate -l $SWAP_SIZE /swapfile >/dev/null
dd if=/dev/zero of=/swapfile bs=1M count=$SWAP_SIZE
chmod 600 /swapfile >/dev/null
mkswap /swapfile >/dev/null
swapon /swapfile >/dev/null
echo '/swapfile    none    swap    defaults    0    0' >> /etc/fstab

echo_indicator "Grub bootloader ..." "Setting up"
pacman -S grub --noconfirm >/dev/null
grub-install /dev/vda >/dev/null
grub-mkconfig -o /boot/grub/grub.cfg >/dev/null
sed -i '/GRUB_TIMEOUT/s/5/0/g' /etc/default/grub    # remove Grub timeout
grub-mkconfig -o /boot/grub/grub.cfg >/dev/null

echo_indicator "$USERNAME, sudo ..." "Adding"
# useradd -m -d /home/$USERNAME -G wheel $USERNAME
adduser -m -G wheel $USERNAME
echo -e "$PASSWORD\n$PASSWORD" | passwd $USERNAME >/dev/null
pacman -S sudo --noconfirm >/dev/null
sed -i '/\%wheel ALL=(ALL) ALL/s/^#//' /etc/sudoers
# visudo
# vim /etc/sudoers
# TODO: uncomment wheel group
# %wheel ALL=(ALL) ALL
# - OR:
# root ALL=(ALL) ALL
# $USERNAME ALL=(ALL) ALL 
#echo_indicator "Successfully set up user, `exit` and login using the new user"

echo_indicator "" "Setting up some additional configurations ..."
sed -i '/Color/s/^#//g' /etc/pacman.conf    # pacman colors

# Exit.
# print_success "Successfully installed Arch"
# print_indicator "Please enter these commands to finish the process:\n1. exit\n2. umount -R /mnt\n3. reboot"
# Add New User and assign sudo privilege

