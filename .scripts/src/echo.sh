#!/usr/bin/env bash

# Colors
declare -g ESC_SEQ="\x1b["
declare -g COL_RESET=$ESC_SEQ"39;49;00m"
declare -g COL_RED=$ESC_SEQ"31;01m"
declare -g COL_GREEN=$ESC_SEQ"32;01m"
declare -g COL_YELLOW=$ESC_SEQ"33;01m"
declare -g COL_BLUE=$ESC_SEQ"34;01m"
declare -g COL_MAGENTA=$ESC_SEQ"35;01m"
declare -g COL_CYAN=$ESC_SEQ"36;01m"

# Echo with ouput color based on [$2]. 
# $1 - Message
# $2 - Accept the following: OK RUNNING ACTION WARN ERROR
function echo_status() {
  case $2 in
    OK)
      echo -e "$COL_GREEN[ok]$COL_CYAN "$1
      ;;
    RUNNING)
      echo -e "$COL_YELLOW ⇒ $COL_RESET "$1": "
      ;;
    ACTION)
      echo -e "\n$COL_YELLOW[action]:$COL_MAGENTA\n ⇒ $1..."
      ;;
    WARN)
      echo -e "$COL_YELLOW[warning]$COL_RESET "$1
      ;;
    ERROR)
      echo -e "$COL_RED[error]$COL_RESET "$1
      ;;
    *)
      echo -e $1
      ;;
  esac
}

function echo_green() {
  echo -e "$COL_GREEN""$1""$COL_RESET"
}

# Echo with white and green
# $1 - Green message
# $2 - White message
function echo_indicator() {
  echo -e "$COL_GREEN➜$COL_RESET" "$2" "$COL_GREEN""$1""$COL_RESET"
}

# Echo error message preceded by a x sign
# $1 - Error message
function echo_err() {
  echo -e "$COL_RED✘$COL_RESET" "$1"
}
