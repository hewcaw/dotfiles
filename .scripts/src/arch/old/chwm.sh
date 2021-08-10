#!/usr/bin/env bash

# References:
# - https://medium.com/@lhennessy/psychedelic-awesome-wm-on-arch-linux-6f8dc053a133

# Import files.
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/configs.sh"



# Install AwesomeWM
install_pkg "awesome xorg-xinit"
echo "awesome" >> ~/.xinitrc

if [ "$DEFAULT_CONFIGURATION" = true ]; then
    mkdir -p ~/.config/awesome
    cp /etc/xdg/awesome/rc.lua ~/.config/awesome
fi

print_success "Successfully set up Awesome, `reboot` and enjoy yourself"
