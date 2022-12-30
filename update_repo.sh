#!/bin/bash

rsync -av ~/.config/alacritty ./.config/
rsync -av ~/.config/rofi ./.config/
rsync -av ~/.config/ranger ./.config/
rsync -av ~/.config/neofetch ./.config/
rsync -av ~/.config/starship.toml ./.config/
rsync -av ~/.config/sxhkd ./.config/
rsync -av ~/.config/dunst ./.config/dunst/


rsync -av ~/.tmux.conf ./
rsync -av ~/.vimrc ./
rsync -av ~/.zshrc ./
rsync -av ~/.zsh_aliases ./


rsync -av ~/.local/bin/ipinfo ./.local/bin/
rsync -av ~/.local/bin/md2html ./.local/bin/
rsync -av ~/.local/bin/nerdfonts-installer ./.local/bin/
rsync -av ~/.local/bin/screenshot ./.local/bin/
rsync -av ~/.local/bin/valid_macchanger ./.local/bin/
rsync -av ~/.local/bin/vpnbook_pass ./.local/bin/
rsync -av ~/.local/bin/batterynotify ./.local/bin/
rsync -av ~/.local/bin/tmux-session-maker ./.local/bin/
rsync -av ~/.local/bin/lofi ./.local/bin/


rsync -av ~/.local/share/icons/custom_icons/ ./.local/share/icons/custom_icons/
