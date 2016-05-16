#!/bin/sh
#
# Gets IRC messages from server running weechat
# You need ssh-agent, so you don't have to enter ssh pass
#

. $(dirname $0)/bar_config

if [[ $1 == "clean" ]]; then
    > $CHAT
    ssh $IRC_SERVER_ADDR "> $CHAT"
    exit 0
fi

while true; do
    ssh $IRC_SERVER_ADDR "cat $CHAT" > $CHAT

    # Check every 3 minutes
    sleep 180
done
