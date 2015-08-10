# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Term color
export TERM=screen-256color-bce

# Editor
export EDITOR=vim

# Theme
ZSH_THEME="ys"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

 # Plugins
plugins=(git colored-man colorize node npm gem ruby rvm command-not-found tmux)

# User configuration
export PATH="$HOME/bin:$PATH"
export RBENV_VERSION=2.1.3
eval "$(rbenv init -)"

# Aliases
if [ -f ~/.zshaliases ]; then
    source ~/.zshaliases
else
    echo 'File not found: ~/.zshaliases'
fi

# ZSH conf
source $ZSH/oh-my-zsh.sh

# Tmux autocompletion
source ~/bin/tmuxinator.zsh
