#!/bin/sh

trap ~/.config/polybar/launch.sh EXIT
killall -q polybar

nm-applet 2>&1 /dev/null &
sleep 1
stalonetray
killall nm-applet
