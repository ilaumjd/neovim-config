#!/bin/bash

# Create Pictures directory if it doesn't exist
mkdir -p ~/Pictures

# Function to take screenshot
take_screenshot() {
    local type=$1
    local opts=""
    
    case "$type" in
        "full")
            opts=""
            type="Full Screen"
            ;;
        "select")
            opts="-s"
            type="Selection"
            ;;
        "window")
            opts="-u"
            type="Active Window"
            ;;
        *)
            echo "Usage: $0 [full|select|window]"
            echo "  full    - Take full screen screenshot"
            echo "  select  - Take screenshot of selected area"
            echo "  window  - Take screenshot of active window"
            exit 1
            ;;
    esac

    scrot $opts 'screenshot_%Y%m%d_%H%M%S.png' -e 'mv $f ~/Pictures' && \
    notify-send "Screenshot Taken" 
}

# Call the function with the provided argument
take_screenshot "$1"

