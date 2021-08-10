#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/../cfg.sh"

echo $DOTFILES_PATH


test_func() {
        echo "Hi"
        }
test_func
