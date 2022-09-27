#!/bin/bash

HOME_DIR=$HOME

# fonts installing...
./.local/bin/nerdfonts-installer

# OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH Plugins
git -C $HOME_DIR/.oh-my-zsh/custom/plugins clone https://github.com/zsh-users/zsh-autosuggestions.git
git -C $HOME_DIR/.oh-my-zsh/custom/plugins clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# starship
curl -sS https://starship.rs/install.sh | sh


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

