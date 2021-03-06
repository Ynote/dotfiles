## Table of contents

- [Prerequisittes](#prerequisites)
- [Setup](#setup)
- [Plugins](#plugins)
  - [Requirements](#requirements)
  - [Quick start](#quick-start)
- [Unite plugin](#unite-plugin)
  - [Compile Vimproc](#compile-vimproc)
  - [Install Ag](#install-ag)
  - [Why using Ag?](#why-using-ag)
  - [Cache](#cache)
  - [Issue with Vim and Vimproc on MacOS
    Mojave](#issue-with-vim-and-vimproc-on-macos-mojave)
- [Custom cheat sheet](#custom-cheat-sheet)
  - [Commands](#commands)
  - [Understanding `.vimrc`](#understanding-vimrc)

## Prerequisites

By default, vim is often installed with a Linux distribution. If not, this setup
is targeted [Vim](http://www.vim.org/download.php) (v7.4.7 or more recent).

## Setup

Create a symlink .vim -> dotfiles/vim
```
$ ln -s ~/dotfiles/vim ~/.vim
```

Create a symlink .vimrc -> dotfiles/vim/.vimrc
```
$ ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
```

Create backup and swap folders in dotfiles/vim
```
$ cd ~/dotfiles/vim
$ mkdir backup swap
```

## Plugins

Use [dein.vim](https://github.com/Shougo/dein.vim) to install bundles and
plugins.

### Requirements
- Vim 8.0 or above or NeoVim
- "git" command in $PATH

### Quick start

Create a folder `~/.vim/bundles`:
```sh
mkdir ~/.vim/bundles
```

Install dein.vim:
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh >
installer.sh

sh ./installer.sh ~/.vim/bundles
```

Open vim and install `vimproc` with its build directly:
```sh
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
```

(cf. https://github.com/Shougo/vimproc.vim#deinvim)

Then, install plugins listed in the `.vimrc`:
```sh
:call dein#install()
```

## Unite plugin

### Compile Vimproc

If you just install Vimproc plugin, you will need to compile it to use it with
Unite.

```sh
$ cd ~/dotfiles/vim/bundles/repos/github.com/Shougo/vimproc.vim
$ make
```

### Install Ag

In order to use my `.vimrc` with Unite, you'll need to install `ag`.

On macOS:
```
brew install the_silver_searcher
```

More information on: https://github.com/ggreer/the_silver_searcher.

### Why using Ag?

Unite `file_rec/async` function can be very slow. I configure Unite `unite_source_rec_async_command` so it uses `ag` to search
through my files.

The `ag` command ignores the files that are listed in `.gitignore` and `.ignore`
files.

Thanks to [Inside's blog](http://insidesblog.blogspot.fr/2013/07/unitevim-and-many-files-in-project.html) for this precious improvement.

### Cache

1. You can clean the cache when you are focus on the Unite buffer with `<c-l>` (`Ctrl` + `l`).

2. As my `.vimrc` command uses de `file_rec/async` function, it caches the result
   in Unite cache directory. When you update your `.gitignore` or `.ignore` files,
   sometimes you will have to clean Unite cache the hard way:

   ```sh
   rm -rf ~/.cache/unite/file_rec
   ```

### Issue with Vim and Vimproc on MacOS Mojave

If you install correctly Vimproc and Unite and you still have this error while
using Unite in Vim:
```
vimproc plugin is not installed.
```

You probably have an issue with the Vim version you are using. As far as I
understand it, the built-in version of Apple provided with Mojave is broken and
use the `python/dyn` library instead of the `python3` library. Check it with
`vim --version`.

To fix it, install the brew version of Vim:
```sh
brew install vim
```

Brew should have create a symlink under the path `/usr/local/bin/vim`. Make sure
`/usr/local/bin` is set in your PATH to enable your machine to use the freshly
installed version of Vim.

## Custom cheat sheet

### Commands

| Commands | Description |
|----------|-------------|
| `Ctrl` + `n` | Open the current directory tree |
| `,` + `a` + `=` | Align all the `=` character in the selection |
| `,` + `a` + `:` | Align all the `,` character in the selection |
| `,` + `g` + `space` | Grep the selection and opens a pane with the grep result |
| `,` + `f` | Search a file by name in the current directory |

### Understanding `.vimrc`

- `<C-n>` means to use the key `Ctrl` and then, the key `n`
- `<Leader>` means to use `,`.
- `let g:foo = 'bar'` means setting `bar` to `foo` as a global variable.
- `map` is used to map a key in general.
- `nmap` is used to map a key in normal mode.
- `imap` is used to map a key in insert mode.
- `vmap` is used to map a key in visual mode.
