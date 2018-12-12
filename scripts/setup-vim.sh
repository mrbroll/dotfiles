#!/usr/bin/env bash

if [ "$(command -v git)" = "" ]; then
    echo "must install git first"
    exit 1
fi

# set up vundle
VIM_DIR=$HOME/.vim
if [ ! -d "$VIM_DIR/bundle" ]; then
    mkdir -p "$VIM_DIR/bundle"
fi

git clone https://github.com/VundleVim/Vundle.vim $VIM_DIR/bundle/Vundle.vim
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
vim +PluginInstall +qall
