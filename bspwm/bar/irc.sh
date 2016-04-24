#!/bin/bash
#
# IRC highlight warn for weechat
#
# Enable with:
# /set trigger.trigger.beep.command "/print -beep;/exec -bg <path>/irc.sh ${tg_date} ${tg_tag_nick}"
# in weechat
#

. $(dirname $0)/bar_config

if [ $# -eq 0 ]; then
    printf "IRC0\n" >> "$CHAT"
else

# Ignore seconds
time="$(echo $2 | cut -d':' -f1-2)"
# Cut large nicks > 8
if [ "$(echo $3 | wc -m)" -gt 8 ]; then
    nick="$(echo $3 | cut -c 1-8)"
    nick=$nick"+"
else
    nick="$(echo $3)"
fi
    printf "%s%s %s\n" "IRC" "${time}" "${nick}" >> "$CHAT"
fi

# Alert sound
if [ $# -gt 0 ]; then
    if [ -x "/usr/bin/aplay" ]; then
        /usr/bin/aplay -q $HOME/.config/sounds/chat.wav &
    fi
fi
