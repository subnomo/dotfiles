#!/bin/bash

cpu=/tmp/cpu

if [ -e $cpu ]; then
    rm $cpu
fi

while true; do
    eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat)
    intervaltotal=$((total-${prevtotal:-0}))

    echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))" > $cpu

    previdle=$idle
    prevtotal=$total

    sleep 5
done
