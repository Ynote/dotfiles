# Totoro debian 9 cleaning

Sometimes, there is no space left on the disk. You can look for different
possibles leads.

## Check the space

First, you can check how the space is allocated on your disks with:
```
df -h
```

On the disk where no space is left, you can check the size of the directories to
find which one is very big:
```
du -h -d 1
```

- the `-h` flag stands for __human__.
- the `-d` flag is to set a max depth, here to 1.

## List of possibles big files or directories

- `/tmp`
- `/var/tmp`
- `/var/log/btmp`: this is the bad login attempt log file. It can be big. You
can follow [this
article](https://tournasdimitrios1.wordpress.com/2010/12/28/how-to-clear-and-delete-last-logged-in-users-and-bad-login-attemps-log-wtmp-and-btmp/) to clean it.

