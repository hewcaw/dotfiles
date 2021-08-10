#!/usr/bin/env bash

# Checkout:
# - https://itsfoss.com/install-arch-linux/
# - https://github.com/LukeSmithxyz/LARBS/blob/master/testing/arch.sh

# TODO:
# - Support UEFI, rEFInd bootloader,
# - Support Wifi.
#   - wifimenu


set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source ../src/arch/config.sh
source ../src/utils.sh

timedatectl set-ntp true

# Fuck Luke Smith, +200M didn't work, the recommendation is +263M.
echo_indicator "$DISK ..." "Partitioning"
cat <<EOF | fdisk $DISK
o
n
p


+500M
n
p


+$ROOT_SIZE
n
p



w
EOF
# partprobe     # No need this anymore?

echo_indicator "Filesystem ..." "Creating"
yes | mkfs.ext4 /dev/vda1 >/dev/null
yes | mkfs.ext4 /dev/vda2 >/dev/null
yes | mkfs.ext4 /dev/vda3 >/dev/null
# mkswap /dev/vda1
# swapon /dev/vda1
mount /dev/vda2 /mnt
mkdir -p /mnt/boot
mount /dev/vda1 /mnt/boot
mkdir -p /mnt/home
mount /dev/vda3 /mnt/home

echo_indicator "Arch Linux ..." "Installing"
pacman -Syy --noconfirm archlinux-keyring >/dev/null
# Setup an appropriate mirror.
# install_pkg "reflector"
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
# reflector -c "SG" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware >/dev/null
genfstab -U /mnt >> /mnt/etc/fstab >/dev/null
# cat tz.tmp > /mnt/tzfinal.tmp
# rm tz.tmp
# mv comp /mnt/etc/hostname

# echo_indicator "" "Arch Chroot"
# cp ./chroot.sh /mnt/chroot.sh && arch-chroot /mnt bash chroot.sh && rm /mnt/chroot.sh
# cp -r /root/dotfiles /mnt/dotfiles/ && arch-chroot /mnt bash dotfiles/bin/.local/bin/bootstrapping/chroot.sh && rm -rf /mnt/dotfiles
# cp -r $DOTFILES /mnt/dotfiles/ && arch-chroot /mnt bash $CHROOT && rm -rf /mnt/dotfiles && umount -R /mnt

# echo_indicator "Successfully installed Arch, please 'shutdown -h now' if you haven't setup shared folder otherwise 'reboot' it."
