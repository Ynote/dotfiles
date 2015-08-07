# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Term color
export TERM=screen-256color-bce

# Theme
ZSH_THEME="ys"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

 # Plugins
plugins=(git colored-man colorize node npm gem ruby rvm command-not-found tmux)

# User configuration
export PATH="$HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

