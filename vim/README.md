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

## Bundle
Use [Vundle](https://github.com/gmarik/Vundle.vim) to install bundles and plugins

```
$  git clone https://github.com/gmarik/Vundle.vim.git ~/dotfiles/vim/bundle/Vundle.vim
```

Launch `vim` and run `:PluginInstall` to install plugins and bundles of the .vimrc.

## Setup Unite
if you just install Vimproc plugin, you will need to compile it to use it with Unite.

```
$ cd ~/dotfiles/vim/bundle/
$ make
```

Unite file_rec/async function can be very slow. If you are using [ag](https://github.com/ggreer/the_silver_searcher), you can populate a .agignore file to enable the searcher to be faster. Please check [Inside's blog](http://insidesblog.blogspot.fr/2013/07/unitevim-and-many-files-in-project.html).

After updating your .agignore, you have to clean Unite cache

```
rm -rf ~/.unite
```
