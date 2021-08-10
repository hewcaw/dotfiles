#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./utils.sh
source ./progs.sh

install_essential
install_zsh
install_fzipgrep
chsh -s $(which zsh)

# if [[ "$DISTRO" == "ubuntu" ]]; then
#   install_pkg "$REGOLITH_PROGS"
# elif [[ "$DISTRO" == "arch" ]]; then
#   install_pkg "$ARCH_PROGS"
#   source ../bootstrapping/n4ob.sh
# fi

# Fzf, ripgrep:
# echo_green "Installing fzf ..."
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >/dev/null
# ~/.fzf/install
# install_pkg "ripgrep"

