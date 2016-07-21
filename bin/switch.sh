#!/bin/sh

TMP=/tmp/theme

# Set location of dark and light themes
DARK=$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
LIGHT=$HOME/.config/base16-shell/scripts/base16-flat.sh

COLORS_XRESOURCES=$HOME/.config/colors/colors.Xresources
DARK_XRESOURCES=$HOME/.config/colors/dark.Xresources
LIGHT_XRESOURCES=$HOME/.config/colors/light.Xresources

# Make sure you source the $COLORS_VIM file in your vimrc
# Use :runtime for relative path
COLORS_VIM=$HOME/.vim_runtime/colors.vim
DARK_VIM=$HOME/.vim_runtime/dark.vim
LIGHT_VIM=$HOME/.vim_runtime/light.vim

if [ -z $1 ]; then echo "usage: switch.sh [theme]"; exit 0; fi

if [[ $1 == "dark" ]]; then
    echo "dark" > $TMP

    eval $DARK
    ln -fs $DARK_XRESOURCES $COLORS_XRESOURCES
    ln -fs $DARK_VIM $COLORS_VIM
fi

if [[ $1 == "light" ]]; then
    echo "light" > $TMP

    eval $LIGHT
    ln -fs $LIGHT_XRESOURCES $COLORS_XRESOURCES
    ln -fs $LIGHT_VIM $COLORS_VIM
fi

xrdb -load ~/.Xresources
