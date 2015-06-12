# Path to your oh-my-zsh installation.
export ZSH=/home/fanny/.oh-my-zsh

# Theme
ZSH_THEME="ys"

# Disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

 # Plugins
plugins=(git colored-man colorize tmux node npm gem ruby rvm command-not-found)

# User configuration
export PATH="/home/fanny/.rvm/gems/ruby-2.1.1/bin:/home/fanny/.rvm/gems/ruby-2.1.1@global/bin:/home/fanny/.rvm/rubies/ruby-2.1.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/fanny/.rvm/bin"

# Aliases
alias log="tail -F /srv/ttrdata/logs/php_errors.log"
alias ylog="tail -F /srv/ttrdata/web/y-note.fr/logs/error.log"
alias ylogaccess="tail -F /srv/ttrdata/web/y-note.fr/logs/access.log"
alias hdlog="tail -F /srv/ttrdata/web/dev.honore-daumier.y-note.fr/logs/error.log"
alias hdlogaccess="tail -F /srv/ttrdata/web/dev.honore-daumier.y-note.fr/logs/access.log"


source $ZSH/oh-my-zsh.sh

