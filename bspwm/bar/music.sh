#!/bin/bash

. $(dirname $0)/bar_config

if [ -z $1 ]; then echo "usage: music.sh [duration]"; exit 0; fi

# Details
album=$(mpc current -f %album%)
artist=$(mpc current -f %artist%)
date=$(mpc current -f %date%)
date=${date:0:4}
track=$(mpc current -f %title%)

# TODO: Add music controls

# Make sure only one dzen applet is running
pid=$(pidof dzen2)
if [[ -z $pid ]]; then
    (
        echo "";
        echo "Track: $track";
        echo "Artist: $artist";
        echo "Album: $album";
        echo "Year: $date";
    ) | dzen2 -p $1 -fn $font -l 7 -w $music_width -x $musicx -y $musicy -e 'onstart=hide,uncollapse;onexit=exec: killall feh;button1=exit;button3=exit;'
fi &

# Get album art

if [ ! -d "$HOME/Music/.artwork" ]; then
    mkdir "$HOME/Music/.artwork"
fi

# Create unique name for specific album
artCode=$(echo "$album $artist" | base64)
albumArt="$HOME/Music/.artwork/$artCode.jpg"

# If the art does not exist, get it from iTunes
if [ ! -f "$albumArt" ]; then
    reqUrl="http://itunes.apple.com/search?term=${track// /+}+${artist// /+}&limit=1"
    songJSON=$(curl -s $reqUrl)

    albumArtUrl=$(echo $songJSON | jq -r '.results[0].artworkUrl100')
    curl -s $albumArtUrl > $albumArt
fi

feh -x -B black -^ "" -g 94x94+$(($musicx-97))+$(($musicy+14)) -Z "$albumArt" &
