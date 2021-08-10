#!/usr/bin/env bash

# ============================================================================== 
# autostart.sh - Autostart programs
# 
# ============================================================================== 

# Grab the absolute dirname of this file
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi


~/.tmp/greenclip daemon &
~/.scripts/keynav daemonize


# Keyboard:
setxkbmap -option "caps:backspace"
setxkbmap -option "shift:both_capslock"

# FIXME: It's still there even I unplug the keyboard
# if [ "$(dmesg | grep -e coleMinik45)" ]; then
#     :
# else
    xmodmap "$DIR/rekeyin"
# fi

xbindkeys

sleep 1s && xset r rate 233 23

imwheel


# Polybar:
# killall xfce4-panel
# killall polybar
# sleep 1s && polybar example &
