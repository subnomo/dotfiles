#!/bin/sh

quality=""

if [ -z "$2" ]; then
    quality="best"
else
    quality=$2
fi

livestreamer "twitch.tv/"$1 $quality &
chromium --app="http://www.twitch.tv/"$1"/chat?popout=" &
