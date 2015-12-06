export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# . /etc/X11/xinit/xinitrc.d/30-dbus.sh

# Run lxappearance briefly to initialize themes & fonts
lxappearance & sleep 0.5; killall lxappearance &

# Set fonts
xset fp+ ~/.fonts/terminesspowerline/

mpd
~/.fehbg &
compton -bc --opengl --vsync opengl-swc --paint-on-overlay
sxhkd &
exec bspwm
