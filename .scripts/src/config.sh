#!/usr/bin/env bash

# [[ "$USER" == "root" ]] && readonly USR="/root" || readonly USR="/home/$USER"

# Distros: ubuntu, arch.
declare -g DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

declare -g DOTFILES_PATH="$HOME/Documents/dotfiles"
declare -g PROGRAMS_PATH="$HOME/Documents/Programs"
declare -g TEMP_PATH="$HOME/Downloads/trash"

# Set Package Manager based on Distro.
# if [[ "$DISTRO" == "Ubuntu" ]]; then
#     readonly PKMI="sudo apt install -y"
#     readonly PKMR="sudo apt remove --purge"
# elif [[ "$DISTRO" == "Arch Linux" ]]; then
#     readonly PKMI="sudo pacman -S --noconfirm"
#     readonly PKMR="sudo pacman -R --noconfirm"
# fi

# Colors and Formatting.
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# GREEN='\033[0;32m'
# LIGHT_RED='\033[0;91m'
# NC='\033[0m'
# 
# BOLD='\e[1m'
# NONE='\e[0m'

# export DOTFILES_PATH="$HOME/Documents/dotfiles"
# export PROGRAMS_PATH="$HOME/Documents/Programs"
# export TEMP_PATH="$HOME/.tmp"

# export DISTRO=$(cat /etc/*-release | head -1 | cut -d '=' -f 2)
