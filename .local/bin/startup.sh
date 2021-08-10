#!/usr/bin/env bash

# TODO: Add virtual machine decision making
mount -t 9p -o trans=virtio,version=9p2000.L /vmshare /home/n4ob/dotfiles
xrandr -s 1920x1080

xset r rate 233 23
