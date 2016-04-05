#!/bin/sh
nm-applet 2>&1 /dev/null &
stalonetray
killall nm-applet
