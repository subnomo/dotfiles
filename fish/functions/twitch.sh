#!/bin/sh

livestreamer "twitch.tv/"$1 source &
chromium --app="http://www.twitch.tv/"$1"/chat?popout=" &
