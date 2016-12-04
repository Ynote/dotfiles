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

# Local configuration
export PATH="$HOME/bin:$PATH"
if [ -f ~/.zshlocal ]; then
    source ~/.zshlocal
else
    echo 'File not found: ~/.zshlocal'
fi

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
