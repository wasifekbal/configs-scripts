#!/bin/bash

HOME_DIR=$HOME

# fonts installing...
./.local/bin/nerdfonts-installer

# OMZ
if [[ ! -d $HOME_DIR/.oh-my-zsh ]]; then
    /usr/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ZSH Plugins
/usr/bin/git -C $HOME_DIR/.oh-my-zsh/custom/plugins clone https://github.com/zsh-users/zsh-autosuggestions.git
/usr/bin/git -C $HOME_DIR/.oh-my-zsh/custom/plugins clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# starship
if [[ $(command -v starship) ]]; then
    echo "Skipping... Starship terminal prompt already installed."
else
    /usr/bin/curl -sS https://starship.rs/install.sh | sh
fi

## copying config files
if [[ ! -d $HOME_DIR/.config ]]; then
    /usr/bin/mkdir "$HOME_DIR/.config"
fi
/usr/bin/cp -rf ./.config/* $HOME_DIR/.config/
echo ".config done..."

# my nvim configs
/usr/bin/git -C $HOME_DIR/.config/ clone https://github.com/wasifekbal/nvim_config nvim
#
# devicons for ranger.
/usr/bin/git -C $HOME_DIR/.config/ranger/plugins/ clone https://github.com/alexanderjeurissen/ranger_devicons.git

# copying files of .local
if [[ ! -d $HOME_DIR/.local ]]; then
    /usr/bin/mkdir "$HOME_DIR/.local"
fi
/usr/bin/cp -rf ./.local/* $HOME_DIR/.local
echo ".local done..."

declare -a dotfiles=(
    .zshrc
    .zsh_aliases
    .tmux.conf
    .vimrc
)

# copying all the dotfiles in home directory
for file in "${dotfiles[@]}"; do
    if [[ -f $HOME_DIR/$file ]]; then
        # keeping backup if a files already exists.
        /usr/bin/mv -v $HOME_DIR/$file $HOME_DIR/$file.backup
    fi
    /usr/bin/cp -v ./$file $HOME_DIR/
done
