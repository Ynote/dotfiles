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
plugins=(
  gitfast
  brew
  nvm
  git
  colored-man
  colorize
  node
  npm
  gem
  ruby
  rbenv
  command-not-found
  tmux
  last-working-dir
  common-aliases
  zsh-syntax-highlighting
  history-substring-search
)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

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

# Load nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Add MySQL 5.6's mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# Tmux autocompletion
source ~/dotfiles/bin/tmuxinator.zsh

# Helps rmagick find imagemagick 6's pkgconfig on gem install
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
