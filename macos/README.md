# Basic install

## Install Homebrew

Type this command in your terminal:
```sh
ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Sometimes:
- Homebrew needs Xcode, you may need to install it,
- You may encounter a compatibility issue between your Xcode current version and
  your OS current version. In this case, update your OS to the last version and
  try the Homebrew install again,

## Basics

```sh
# Utilities
brew install git
brew install wget
brew install openssl
brew install cmake
brew install tree
brew install pwgen
brew install z

# Browsers
brew cask install google-chrome
brew cask install firefox

# Images management
brew install optipng
brew install jpegoptim
brew install svgo

# Chat
brew cask install slack

# Better alternative to Spotlight
brew cask install alfred
```

## Web development

```sh
# Web utilities
brew install overmind
brew cask install ngrok

# AWS
brew install awscli
brew install amazon-ecs-cli

# Services
brew cask install docker

# Useful to open/close services (postgre, redis, elasticsearch, …)
# installed with Brew in the System Preferences
brew cask install launchrocket
```

## Entertainment

```sh
brew cask install spotify
```
