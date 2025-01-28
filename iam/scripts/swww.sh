#!/bin/bash

swww init

while true; do
    swww img "$(find ~/.config/iam/wallpapers -type f | shuf -n 1)" \
        --transition-fps 60 \
        --transition-type random \
        --transition-duration 3
        
    sleep 3600
done
