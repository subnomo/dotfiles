#
# ~/.bashrc
#

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

