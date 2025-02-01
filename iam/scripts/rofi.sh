#!/bin/bash

# Function to handle rofi launchers
rofi_launch() {
  local mode=$1

  case "$mode" in
  "launcher")
    rofi -show drun \
      -font "Inter Bold 16"
    ;;
  "power")
    rofi -show menu \
      -font "Inter Bold 16" \
      -modi "menu:rofi-power-menu --choices=suspend/shutdown/reboot/lockscreen/logout"
    ;;
  esac
}

# Call the function with the provided argument
rofi_launch "$1"
