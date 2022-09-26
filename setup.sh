#!/bin/bash

# fonts installing...
./.local/bin/nerdfonts-installer

HOME_DIR=$HOME

if [[ ! -d $HOME_DIR/.config ]]; then
  mkdir "$HOME_DIR/.config";
fi
cp -rf ./.config/* $HOME_DIR/.config/;
echo ".config done...";

if [[ ! -d $HOME_DIR/.local ]]; then
  mkdir "$HOME_DIR/.local";
fi
cp -rf ./.local/* $HOME_DIR/.local;
echo ".local done...";

cp -rf ./.zshrc ./.zsh_aliases ./.tmux.conf ./.vimrc $HOME_DIR/

