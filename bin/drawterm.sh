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

if [ "$W" -gt "1" ]; then
    # Calculate width and height to block/font size
    #let W=$(( $W / 6 ))-1
    #let H=$(( $H / 11 ))-3
    # s="$W"x"$H"+"$X"+"$Y"
    s="${W}x${H}+200+200"
    echo $s

    bspc rule -a \* --one-shot state=floating rectangle="${W}x${H}+0+0"

    i=$(xdotool getactivewindow)
    win=$i
    kitty &
    #kitty /bin/sh -c "xdotool getactivewindow > /tmp/active_window; zsh -i" &

    for i in {0..49}; do # timeout
        win=$(xdotool getactivewindow)

        if [ "$win" == "$i" ]; then
            sleep .1

            break
        fi
    done

    xdotool windowmove $(/bin/cat /tmp/active_window) $X $Y
    rm /tmp/active_window
fi

exit 0

