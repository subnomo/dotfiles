#!/bin/bash

. $(dirname $0)/bar_config

trap "killall bspc && killall xprop && $(dirname $0)/clean.sh" SIGINT SIGTERM EXIT

$(dirname $0)/bar_start | lemonbar -f $font -f $iconfont -g $geometry -p

