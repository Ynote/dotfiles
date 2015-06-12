## Setup

After Zsh installation, change the login shell.

```
$ chsh
Enter the new value, or press return for the default
    Login Shell [/bin/bash]:/bin/zsh
```

*(You may need to remove `.oh-my-zsh/custom` and `.zshrc` before creating the symlinks)*

Create a symlink .oh-my-zsh/custom -> dotfiles/zsh/.oh-my-zsh/custom
```
$ ln -s ~/dotfiles/zsh/.oh-my-zsh/custom ~/.oh-my-zsh/custom
```

Create a symlink .zshrc -> dotfiles/zsh/.zshrc
```
$ ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```
