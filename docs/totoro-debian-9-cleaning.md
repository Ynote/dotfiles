# Totoro debian 9 cleaning

Sometimes, there is no space left on the disk. You can look for different
possibles leads.

## Temporary directories

- `/tmp`
- `/var/tmp`

## Possible big temporary files

- `/var/log/btmp`: this is the bad login attempt log file. It can be big. You
can follow [this
article](https://tournasdimitrios1.wordpress.com/2010/12/28/how-to-clear-and-delete-last-logged-in-users-and-bad-login-attemps-log-wtmp-and-btmp/) to clean it.

