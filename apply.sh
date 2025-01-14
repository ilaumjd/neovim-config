#!/bin/bash

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s "$DOTFILES_DIR/nvim" ~/.config/nvim
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ln -s "$DOTFILES_DIR/nvim" ~/.config/nvim
    ln -s "$DOTFILES_DIR/eww" ~/.config/eww
    ln -s "$DOTFILES_DIR/i3" ~/.config/i3
    ln -s "$DOTFILES_DIR/picom" ~/.config/picom
    ln -s "$DOTFILES_DIR/rofi" ~/.config/rofi
    ln -s "$DOTFILES_DIR/scripts" ~/.config/scripts
    ln -s "$DOTFILES_DIR/wallpapers" ~/.config/wallpapers
fi
