#!/bin/bash

icon=""

layout=$(setxkbmap -query | grep layout | cut -d":" -f2 | tr -d '[:space:]')

case "$1" in
    switch)
        OLD_IFS="$IFS"
        IFS=','
        read -ra LG <<< "$2" # str is read into an array as tokens separated by IFS
        IFS="$OLD_IFS" # reset to default value after usage
        indices=${!LG[*]}
        n=0
        for i in $indices; do # access each element of array
            # if current layout, select the following
            if [[ "${LG[$i]}" == "$layout" ]]; then
                n=$(($i + 1))
                # loop
                if [[ "$n" == "${#LG[@]}" ]]; then
                    n=0
                fi
            fi
        done
        setxkbmap ${LG[$n]}
        ;;
    layout|*)
        # By default print current layout
        echo "%{F#0892a5}$icon %{F#fafafa}$layout"
        ;;
esac
