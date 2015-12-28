#!/bin/bash

. $(dirname $0)/bar_config

if [ -z $1 ]; then echo "usage: music.sh [duration]"; exit 0; fi

# Details
album=$(mpc current -f %album%)
artist=$(mpc current -f %artist%)
date=$(mpc current -f %date%)
date=${date:0:4}
track=$(mpc current -f %title%)

# Icons
prev=$(dirname $0)/icons/prev.xbm
next=$(dirname $0)/icons/next.xbm
pause=$(dirname $0)/icons/pause.xbm
play=$(dirname $0)/icons/play.xbm

perc=$(mpc | awk 'NR == 2 {gsub(/[()%]/,""); print $4}')
percbar=$(echo -e "$perc" | gdbar -fg $color_music_hl2 -h 1 -w $(($music_width-25)))

# Make sure only one dzen applet is running
pid=$(pidof dzen2)
if [[ -z $pid ]]; then
    (
        echo "";
        echo "  ^fg($color_music_hl)Track:^fg()  $track";
        echo "  ^fg($color_music_hl)Artist:^fg() $artist";
        echo "  ^fg($color_music_hl)Album:^fg()  $album";
        echo "  ^fg($color_music_hl)Year:^fg()   $date";
        echo "  $percbar";
        echo "           ^ca(1, mpc prev) ^i($prev)  ^ca()^ca(1, mpc pause)  ^i($pause)  ^ca()^ca(1, mpc play)  ^i($play)  ^ca()^ca(1, mpc next)  ^i($next)  ^ca()"
    ) | dzen2 -p $1 -fn $font -l 7 -w $music_width -x $musicx -y $musicy -e 'onstart=hide,uncollapse;onexit=exec: killall feh;button1=exit;button3=exit;' &
fi &

# Get album art

if [ ! -d "$HOME/Music/.artwork" ]; then
    mkdir -p "$HOME/Music/.artwork"
fi

# Create unique name for specific album
artCode=$(echo "$album $artist" | base64 | awk 'BEGIN{ORS="";} {print}')
albumArt="$HOME/Music/.artwork/$artCode.jpg"

# If the art does not exist, get it from iTunes
if [ ! -f "$albumArt" ]; then
    # Sanitize strings
    track=${track// /+}
    track=${track//&/}

    artist=${artist// /+}
    artist=${artist//&/}

    reqUrl="http://itunes.apple.com/search?term=$track+$artist&limit=1"
    songJSON=$(curl -s $reqUrl)

    albumArtUrl=$(echo $songJSON | jq -r '.results[0].artworkUrl100')
    curl $albumArtUrl > $albumArt
fi

feh -x -B black -^ "" -g 94x94+$(($musicx-97))+$(($musicy+14)) -Z "$albumArt" &
