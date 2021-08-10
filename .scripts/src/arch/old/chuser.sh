#!/usr/bin/env bash

# References:
# - 2017 (but details) - https://www.2daygeek.com/arch-linux-post-installation-30-things-to-do-after-installing-arch-linux/


# Import files
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/../helpers.sh"
. "$DIR/configs.sh"


# Check for updates
pacman -Syu --noconfirm




# Add New User and assign sudo privilege
print_indicator "Set $USERNAME password"
useradd -m -g users -G wheel $USERNAME
passwd $USERNAME
# TODO: uncomment wheel group
# %wheel ALL=(ALL) ALL
# - OR:
# root ALL=(ALL) ALL
# $USERNAME ALL=(ALL) ALL
install_pkg "sudo"
print_success "Successfully set up user, `exit` and login using the new user"




# TODO: Hardware
# - Video card


# Addition settings
localectl set-locale LANG="en_US.UTF-8"     # locale
