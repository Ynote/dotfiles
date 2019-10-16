# MacOS Mojave setup

This setup is for my personnal MacBook for web development.

Before installing services and librairies for web development, make sure to
install basic tools with this documentation:
https://github.com/Ynote/dotfiles/tree/master/macos.

## Web development

### Ruby

1. Install `rbenv`:
   ```sh
   brew install openssl libyaml libffi
   brew install rbenv ruby-build
   ```

2. Then, install Ruby with some flags to specify your dependancies paths:
   ```sh
   RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml)" rbenv install 2.3.7
   rbenv global 2.3.7
   ```

3. Add this line to your `~/.zshrc` (or your local `~/.zshlocal`):
   ```sh
   eval "$(rbenv init -)"
   ```

4. Reload your bash profile to enable `rbenv` to init:
   ```sh
   source ~/.zshrc
   ```

5. Install Bundler:
   ```sh
   gem install bundler
   ```

### Node

1. Install `nvm`:
   ```sh
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
   ```

   You can check the [official
   documentation](https://github.com/nvm-sh/nvm#install--update-script) to stay
   up-to-date with the right repository.

   The install will automatically add some variables in your bash profile.

2. Reload your bash profile to enable `nvm` to init:
   ```sh
   source ~/.zshrc
   ```

3. Install the version of Node you need:
   ```sh
   nvm install 8.16.0
   ```

### MySQL

### PostgreSQL

Install with:
```sh
brew install postgresql && brew services start postgresql
```

### Redis

Install with:
```sh
brew install redis && brew services start redis
```
