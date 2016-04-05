#!/bin/sh
# Blurs the current wallpaper

# Grab image location from .fehbg
IMAGE="$(cat $HOME/.fehbg | tail -n 1 | cut -d\' -f2)"

# Restore non-blurred with -r
if [ "$1" == "-r" ]; then
    feh --bg-fill $IMAGE --no-fehbg
    exit
fi

OUT="/tmp/$(echo $IMAGE | rev | cut -d/ -f1 | rev)"

# Only blur if blurred image does not already exist
if [ ! -f $OUT ]; then
    convert $IMAGE -filter Gaussian -resize 50% \
        -define filter:sigma=2.5 -resize 200% $OUT
fi

feh --bg-fill $OUT --no-fehbg
