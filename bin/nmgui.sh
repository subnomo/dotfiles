#!/bin/sh

trap rreload EXIT

nm-applet 2>&1 /dev/null &
sleep 1
stalonetray
killall nm-applet
