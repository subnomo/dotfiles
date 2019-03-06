HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt inc_append_history autocd notify extended_history #interactivecomments
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sub/.zshrc'

autoload -Uz compinit
fpath+=~/.zfunc
compinit
# End of lines added by compinstall

ZSH_THEME=""

source /usr/share/zsh/share/antigen.zsh

#antigen use oh-my-zsh

antigen bundle git
antigen bundle pip

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

source $HOME/.bash_aliases
alias please='sudo $(fc -ln -1)'
[[ -f $HOME/.profile ]] && source $HOME/.profile

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Some extra command navigation (ctrl+arrows, home & end keys)
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Search
bindkey '^R' history-incremental-search-backward

# Completion
zstyle ':completion:*:*:mpv:*' file-patterns '*.(#i)(flv|mp4|webm|mkv|wmv|mov|avi|mp3|ogg|wma|flac|wav|aiff|m4a|m4b|m4v|gif|ifo)(-.) *(-/):directories' '*:all-files'

(cat ~/.cache/wal/sequences &)
