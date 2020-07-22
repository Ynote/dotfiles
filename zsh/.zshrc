# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="ys"

# Enable zsh hooks
autoload -U add-zsh-hook

# Term color
export TERM=screen-256color-bce

# Editor
export EDITOR=vim

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

 # Plugins
plugins=(
  gitfast
  brew
  nvm
  git
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

#toggleInlineStyle ZSH conf
source $ZSH/oh-my-zsh.sh

# Rbenv config
eval "$(rbenv init -)"

# NVM config
# load-nvmrc() {
  # local node_version="$(nvm version)"
  # local nvmrc_path="$(nvm_find_nvmrc)"

  # if [ -n "$nvmrc_path" ]; then
    # local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    # if [ "$nvmrc_node_version" = "N/A" ]; then
      # nvm install
    # elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # nvm use
    # fi
  # elif [ "$node_version" != "$(nvm version default)" ]; then
    # echo "Reverting to nvm stable version"
    # nvm use stable
  # fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Tmux autocompletion
source ~/dotfiles/bin/tmuxinator.zsh

# iTerm2 integration for macOS
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

############################################################################
#####    PLEASE consider using ~/.zshlocal to add your local config    #####
############################################################################
