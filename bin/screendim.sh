#!/bin/bash
#
# Description: Toggle screen dimming 0-100% with one keybinding
#              (Bind hotkey to execute this script; eg.: W-A-d)
# Requires:    xset, xbacklight
#

XBL=$(xbacklight -get)

if [[ "$XBL" == "4."* ]]; then
    xset dpms 600 600 600 && xset s on
    xbacklight -set 100
else
    xset dpms 0 0 0 && xset -dpms && xset s off
    xbacklight -set 5
fi

exit 0
