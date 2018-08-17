#!/bin/sh

dir=$(echo $1 | cut -d ' ' -f 1)

bspc node -z "$@"

if [ $? -eq 1 ]; then
    case $dir in
        left)
            dir="right"
            ;;
        bottom)
            dir="top"
            ;;
        top)
            dir="bottom"
            ;;
        right)
            dir="left"
            ;;
    esac

    bspc node -z "$dir" "${@:2}"
fi
