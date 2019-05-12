## Install

Install ZSH and make it the default shell :
```sh
sudo apt install zsh
sudo chsh -s $(which zsh)
```

Log out and login back again to use your new default shell. Try:
```sh
echo $SHELL
```

## Custom setup

Create a symlink .oh-my-zsh/custom -> dotfiles/zsh/.oh-my-zsh/custom
```
$ ln -s ~/dotfiles/zsh/.oh-my-zsh/custom ~/.oh-my-zsh/custom
```

Create a symlink .zshrc -> dotfiles/zsh/.zshrc
```
$ ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

*(You may need to remove `.oh-my-zsh/custom` and `.zshrc` before creating the symlinks)*
