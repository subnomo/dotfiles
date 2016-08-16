#!/bin/bash
#
#   Author:         Twily                                           2015
#   Description:    Spawn a new terminal window inside a drawn rectangle
#   Requires:       slop (or xrectsel: http://pastebin.com/eeLRBed6), urxvt
#   Usage:          Bind hotkey to $ sh ./drawterm
#
#   Note:           if using compton w/ shadows, exclude "class_g = 'slop'"
#

M=2                 # slop border width

REC=$(slop -t 0 -b $M -c 1,1,1,1 -f "%w %h %x %y" --nokeyboard) || exit 1
#REC=$(xrectsel) || exit 1

IFS=' ' read -r W H X Y <<< "$REC"

aX=$(( $X - $M )) && aY=$(( $Y - $M ))
aW=$(( $W + ( $M * 2 ) )) && aH=$(( $H + ( $M * 2 ) ))

# Make floating for bspwm
bspc rule -a \* --one-shot state=floating

if [ "$W" -gt "1" ]; then
    # Calculate width and height to block/font size
    let W=$(( $W / 6 ))-1
    let H=$(( $H / 11 ))-3

    urxvt -g $W"x"$H"+"$X"+"$Y &

    for i in {0..49}; do # timeout
        if ps -p $! >/dev/null; then
            sleep .1

            break
        fi
    done
fi

exit 0

