#!/bin/sh

quality=""

if [ -z "$2" ]; then
    quality="best"
else
    quality=$2
fi

streamlink "https://twitch.tv/"$1 $quality "${@:3}" &
chromium --app="http://www.twitch.tv/"$1"/chat?popout=" &
