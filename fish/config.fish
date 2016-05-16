# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

# Path to your oh-my-fish configuration.
set -g OMF_CONFIG $HOME/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

if test ! -e /tmp/theme
    echo "light" > /tmp/theme
end

switch.sh (cat /tmp/theme)

if test -z (pgrep "ssh-agent" > /dev/null)
    ssh_agent > /dev/null
end

# Start mpd if not already running
if test ! -e ~/.config/mpd/pid
    mpd
end

env -i HOME=$HOME dash -l -c printenv | sed -e '/PATH/s/:/ /g;s/=/ /;s/^/set -x /' | source

# Powerline
#function fish_prompt
#	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh left
#end

#function fish_right_prompt
#	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh right
#end
