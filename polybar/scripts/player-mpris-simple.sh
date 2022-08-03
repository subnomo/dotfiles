#!/bin/sh

player_status=$(playerctl status -p mpd,spotify 2> /dev/null)

note=""
prev=""
next=""
play=""
pause=""

click_prev="%{A1:playerctl previous:}$prev%{A}"
click_next="%{A1:playerctl next:}$next%{A}"
click_play="%{A1:playerctl play-pause:}$play%{A}"
click_pause="%{A1:playerctl play-pause:}$pause%{A}"

if [ "$player_status" = "Playing" ]; then
    echo "$note $(playerctl metadata artist) - $(playerctl metadata title) $click_prev $click_pause $click_next"
elif [ "$player_status" = "Paused" ]; then
    echo "$note $(playerctl metadata artist) - $(playerctl metadata title) $click_prev $click_play $click_next"
else
    echo "$note $click_prev $click_play $click_next"
fi
