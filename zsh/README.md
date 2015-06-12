## Setup

After Zsh installation, change the login shell.

```
$ chsh
Enter the new value, or press return for the default
    Login Shell [/bin/bash]:/bin/zsh
```

*(You may need to remove `.oh-my-zsh` and `.zshrc` before creating the symlinks)*

Create a symlink .oh-my-zsh -> dotfiles/zsh/.oh-my-zsh
```
$ ln -s ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
```

Create a symlink .zshrc -> dotfiles/zsh/.zshrc
```
$ ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```
