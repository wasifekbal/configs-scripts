# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"

# Set up the prompt
fpath+=$HOME/.zsh/pure
autoload -Uz promptinit
promptinit
prompt pure

PURE_PROMPT_SYMBOL=󰊕
zstyle ':prompt:pure:prompt:success' color cyan
zstyle :prompt:pure:user color green
zstyle :prompt:pure:host color green

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# manual prompt
# PROMPT='%F{208}%n%f in %F{226}%~%f -> '

source ~/.zsh/directories.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

###########
# Aliases #
###########

# package manager
alias u="sudo apt update"
alias ug="sudo apt upgrade"
alias lu="sudo apt list --upgradable"
alias uu="sudo apt update && sudo apt upgrade"
alias i="sudo apt install"
alias s="apt search"
alias yeet="sudo apt purge"
alias clean="sudo apt autoremove && sudo apt autoclean"

# misc
alias ip="ip -c"
alias v="vim"
alias dust="du -sh * | sort -hr"
alias bcat="batcat"
alias q="exit"
alias l="exa -lah"
alias ll="exa -lh"

export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

mdg () { mkdir -p $1 && cd $1; }
