# Zsh

#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source ./echo.sh
source ./utils.sh

# TODO: Change these two.
readonly REGOLITH_PROGS="chromium-browser"


install_essential() {
   echo_indicator "essential programs ..." "Installing"
   install_pkg "git curl stow xclip kitty" >/dev/null
}

install_kvm() {
  echo_indicator "KVM ..." "Installing"
  install_pkg "qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager" >/dev/null
  sudo adduser $USER libvirt
  sudo adduser $USER libvirt-qemu
  # TODO: Print "Log out to completing the setup"
}

install_fonts() {
  echo_indicator "Source Code Pro font ..." "Installing"

  mkdir -p ~/.tmp/ubuntumono_nf && cd ~/.tmp/ubuntumono_nf
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
  unzip SourceCodePro.zip >/dev/null
  sudo mv *.ttf /usr/share/fonts
  sudo fc-cache -fv >/dev/null
  rm -rf ~/.tmp/ubuntumono_nf

  install_pkg "fonts-noto-color-emoji"
}

install_fzipgrep() {
  echo_indicator "fzf, ripgrep ..." "Installing"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >/dev/null
  ~/.fzf/install
  install_pkg "ripgrep" >/dev/null
}

install_zsh() {
  echo_indicator "zsh, ohmyzsh and his friends (plugins) ..." "Installing"
  install_pkg "zsh" >/dev/null
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  git clone --quiet git://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone --quiet https://github.com/zsh-users/zsh-history-substring-search \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --quiet https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

  rm ~/.zshrc && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc && chsh -s $(which zsh)
  zsh   # Change shell to install nvm
  nvm install stable
}

install_flutter() {
  if [[ "$DISTRO" != "ubuntu" ]]; then
    echo_err "Ubuntu only"
    exit 1
  fi

  echo_indicator "Flutter, Android Studio ..." "Installing"
  sudo snap install flutter --classic
  sudo snap install android-studio --classic
}

install_qmk() {
  echo_indicator "QMK ..." "Installing"
  install_pkg "git python3-pip"
  python3 -m pip install --user qmk
}

# Neovim
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim
# sudo apt-get install python3-dev python3-pip python3-neovim
