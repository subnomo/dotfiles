#
# ~/.bash_aliases
#

alias netflix='google-chrome-stable --app="https://netflix.com/"'
#alias plex='chromium --app="https://app.plex.tv/web/app"'
alias plex='plexmediaplayer --scale-factor=1'
alias redact='unset HISTFILE'
alias rd='redact'
alias c='clear'
alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
alias ssh='TERM=linux ssh'
alias cat='bat'
alias yt-mp3='youtube-dl -x --audio-format mp3 --output "%(title)s.%(ext)s"'
alias rg='rg --smart-case'
alias cls='clear && printf "\e[3J"'
#alias google-chrome-stable='google-chrome-stable --force-dark-mode'

# LAN default + font smoothing
alias rdesktop='rdesktop -x 0x80'

# Colored manpages
function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;34m") \
        LESS_TERMCAP_md=$(printf "\e[1;34m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;47;33m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        PAGER="${commands[less]:-$PAGER}" \
        man "$@"
}

transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
}

here() {
    local term=$(ps -aux | grep `ps -p $$ -o ppid=` | awk 'NR==1{print $11}')
    (nohup $term &>/dev/null &)
}
