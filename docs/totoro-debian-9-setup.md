# Debian 9 setup on totoro.ynote.hk

This setup is for my personnal VM on Gandi. I use it to serve some websites,
along with my [profile page](http://ynote.hk/), and to host personnal projects
under a private sub-domain.

Before installing, make sure to update APT available packages list:
```sh
sudo apt update
sudo apt-get update
```

## Table of contents

- [Basics](#basics)
  - [Development tools](#development-tools)
  - [Git](#git)
  - [Dotfiles](#dotfiles)
  - [Language error with Bash](#language-error-with-bash)
- [Web server](##web-server)
- [Web development](#web-development)
  - [Node](#node)
  - [MySQL](#mysql)

## Basics

### Development tools

The development tools are combined GNU GCC Compiler, c++, make, and some other
packages. To install them :
```sh
sudo apt install build-essential
```

### Git

```sh
sudo apt install git
git --version
```

### Dotfiles

Clone the the [dotfiles
repository](https://github.com/Ynote/dotfiles):
```sh
git clone git@github.com:Ynote/dotfiles.git
```

Follow each READMEs:
- [ZSH](https://github.com/Ynote/dotfiles/tree/master/zsh)
- [Vim](https://github.com/Ynote/dotfiles/tree/master/vim)
- [Tmux](https://github.com/Ynote/dotfiles/tree/master/tmux)

### Language error with Bash

If you encounter this error:
```sh
bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
```

You have to add the missing locale. Edit `/etc/locale.gen` and uncomment the
line with the missing locale.

Then, generate the locales again:
```sh
sudo locale-gen
```

## Web server

Install Apache:
```sh
sudo apt install apache2
```

Add your Apache configuration files in `/etc/apache2/sites-availables` and then,
enable them with:
```sh
a2ensite
```

Restart Apache:
```sh
sudo systemctl restart apache2
```

If your webpage cannot be served, check:
- your Apache version (and the syntax of your configuration files),
- if your DNS is defined correctly.

## Web development

### Node

If you ZSH is setup correctly, you should have NVM installed. Check the node
versions installed by NVM previously and uninstall them if necessary (to delete
all the legacy in `.nvm`):
```sh
nvm list
nvm uninstall v.xx-xx
```

Then, install the latest version of Node:
```sh
nvm install node
```

### MySQL

Install MySQL Install following the [official MySQL
website](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install).

Then, check MySQL is installed and running:
```sh
sudo systemctl status mysql
```

The output should be something like this:
```sh
● mysql.service - MySQL Community Server
   Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2019-05-12 05:19:32 CEST; 16h ago
     Docs: man:mysqld(8)
           http://dev.mysql.com/doc/refman/en/using-systemd.html
  Process: 12465 ExecStartPre=/usr/share/mysql-8.0/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
 Main PID: 12501 (mysqld)
   Status: "SERVER_OPERATING"
    Tasks: 38 (limit: 4915)
   CGroup: /system.slice/mysql.service
           └─12501 /usr/sbin/mysqld
```

Secure MySQL:
```sh
mysql_secure_installation
```

Test MySQL with `mysqladmin`. It is a command line administrative client for
MySQL. We'll use it to connect to the server and output some version and status
information:`
```sh
mysqladmin -u root -p version
```

The output should be something like this:
```sh
mysqladmin  Ver 8.0.16 for Linux on x86_64 (MySQL Community Server - GPL)
Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version          8.0.16
Protocol version        10
Connection              Localhost via UNIX socket
UNIX socket             /var/run/mysqld/mysqld.sock
Uptime:                 16 hours 36 min 9 sec

Threads: 2  Questions: 11  Slow queries: 0  Opens: 144  Flush tables: 3  Open
tables: 48  Queries per second avg: 0.000
```
