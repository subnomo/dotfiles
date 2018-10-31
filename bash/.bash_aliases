#
# ~/.bash_aliases
#

alias netflix='google-chrome-stable --app="https://netflix.com/"'
alias plex='chromium --app="https://app.plex.tv/web/app"'
alias urnn='$HOME/.config/urnn/urnn'
alias redact='unset HISTFILE'
alias c='clear'
alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
alias ssh='TERM=linux ssh'
alias cat='bat'

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
