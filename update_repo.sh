#!/bin/bash

rsync -a ~/.config/alacritty ./.config/
rsync -a ~/.config/rofi ./.config/
rsync -a ~/.config/ranger ./.config/
rsync -a ~/.config/neofetch ./.config/
rsync -a ~/.config/starship.toml ./.config/
rsync -a ~/.config/systemd ./.config/
rsync -a ~/.config/sxhkd ./.config/


rsync -a ~/.tmux.conf ./
rsync -a ~/.vimrc ./
rsync -a ~/.zshrc ./
rsync -a ~/.zsh_aliases ./
