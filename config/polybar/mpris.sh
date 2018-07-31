#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""

player_status=$(playerctl status 2> /dev/null)
if [[ $? -ne 0 ]]; then
    echo ""
fi

## Foreground color formatting tags are optional
#if [[ $player_status = "Playing" ]]; then
#    echo "%{F#D08770}$icon $metadata"       # Orange when playing
#elif [[ $player_status = "Paused" ]]; then
#    echo "%{F#65737E}$icon $metadata"       # Greyed out info when paused
#else
#    echo "%{F#65737E}$icon"                 # Greyed out icon when stopped
#fi

case "$1" in
    title)
        metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
        echo $metadata
        ;;
    play-pause)
        if [[ $player_status = "Playing" ]]; then
            printf "\uf04c"
        elif [[ $player_status = "Paused" ]]; then
            printf "\uf04b"
        else
            printf "\uf04d"
        fi
        ;;
    next)
        printf "\uf04e"
        ;;
    prev)
        printf "\uf04a"
        ;;
    *)
        # By default print output for bar
        echo ""
        ;;
esac
