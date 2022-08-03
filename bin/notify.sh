#!/bin/sh

if [ -z $1 ]; then
    echo "usage: $0 message"
    exit 1
fi

export DISPLAY=:0

/usr/bin/notify-send "$1"
