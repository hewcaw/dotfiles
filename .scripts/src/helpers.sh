#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/cfg.sh"

# ============================================================================
# helper.sh - Helper functions
#
# ============================================================================



# install_pkg - Install package
# @pkg_name (str): name of the package
install_pkg() {
    local pkg_name=$1
    $PKMI $pkg_name
}

helper_install_print_pkg() {
    local pkg_name=$1
    echo -e "${GREEN}Installing $pkg_name . . .${NC}"    
    $PKMI $pkg_name
}

helper_print_green() {
    echo -e "${GREEN}$1${NC}"    
    }

helper_print_light_red() {
    echo -e "${LIGHT_RED}$1${NC}"
    }

# print_indicator - Print indicator message in bold text
# @message (str): message
print_indicator() {
    local message=$1
    echo -e "${BOLD}${LIGHT_RED}➜ ${NC}${message}${NC}"
}


# print_success - Print success message in green bold text
# @message (str): message
print_success() {
    local message=$1
    echo -e "${BOLD}${GREEN}✓ ${message}${NC}${NONE}"
}
