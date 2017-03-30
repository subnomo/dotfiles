#if test ! -e /tmp/theme
#    echo "light" > /tmp/theme
#end

#set theme (cat /tmp/theme)
#switch.sh $theme
#switch.fish $theme

#if status --is-interactive
#    eval $HOME/.config/colors/$theme.fish
#end

wal -r &

if not pgrep -f ssh-agent > /dev/null
    ssh_agent > /dev/null 2>&1
end

# Start mpd if not already running
#if test ! -e ~/.config/mpd/pid
#    mpd
#end

#env -i HOME=$HOME dash -l -c printenv | sed -e '/PATH/s/:/ /g;s/=/ /;s/^/set -x /' | source

# Powerline
#function fish_prompt
#	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh left
#end

#function fish_right_prompt
#	env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh right
#end

#set -x PATH "$HOME/.pyenv/bin" $PATH
#status --is-interactive; and . (pyenv init -|psub)
#status --is-interactive; and . (pyenv virtualenv-init -|psub)
#status --is-interactive; and . (rbenv init -|psub)

set -g __fish_history_file        ~/.local/share/fish/fish_history
set -g __fish_history_backup_file $__fish_history_file.bak
set -g __fish_history_pid_file    $__fish_history_file.pid

if test -f $__fish_history_backup_file
    read -l histpid < $__fish_history_pid_file
    # If the pid no longer has open files, restore the original history file
    if not lsof -p $histpid >/dev/null
        mv -f -- $__fish_history_backup_file $__fish_history_file
        rm -f -- $__fish_history_pid_file
    end
end
