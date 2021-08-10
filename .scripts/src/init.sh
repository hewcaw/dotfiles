#!/usr/bin/env bash

# ============================================================================
# init.sh - Install or initial requirements before 
#
# ============================================================================

# Source dependencies
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/helper.sh"



# Both `.tmp` & `apps` are required
[[ -d ~/.tmp/apps/ ]] && : || mkdir -p ~/.tmp/apps   

[[ ! -x "$(command -v wget)" ]] && : || helper_install_package "wget"
[[ ! -x "$(command -v curl)" ]] && : || helper_install_package "curl"
