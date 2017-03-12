#!/bin/sh

trap rreload EXIT

nm-applet 2>&1 /dev/null &
stalonetray
killall nm-applet
