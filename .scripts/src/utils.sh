#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./echo.sh
source ./config.sh

# Install package
# $1 - Packages
install_pkg() {
  echo_indicator "$1 ..." "Installing "

  if [[ "$DISTRO" == "ubuntu" ]]; then
    # sudo apt install -y "$1" 2> >(echo_err) >/dev/null
    sudo apt-get install -y $1 >/dev/null
  elif [[ "$DISTRO" == "arch" ]]; then
    sudo pacman -S --noconfirm $1 >/dev/null
  fi
}
