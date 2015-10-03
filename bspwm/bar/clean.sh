#!/bin/bash

killall bar_start
kill -9 $(pgrep -f "/bin/bash .config/bspwm/bar/")
killall lemonbar

