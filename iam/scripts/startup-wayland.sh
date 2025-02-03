#!/bin/bash

swww-daemon &
swww img "$(find ~/.config/iam/wallpapers -type f | shuf -n 1)" --transition-type none &
eww open bar &
dunst &
hypridle &
