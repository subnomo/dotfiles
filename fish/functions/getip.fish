function getip
	ip addr show dev wlp2s0 | sed -n -r 's@.*inet (.*)/.*brd.*@\1@p'
end
