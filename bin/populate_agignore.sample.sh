#!/bin/sh

# Thanks to inside for this script:
# http://insidesblog.blogspot.fr/2013/07/unitevim-and-many-files-in-project.html

APP_DIR=path_to_your_project
AG_IGNORE_FILE=.agignore

# A list of directories or files you want unite.vim to inspect.
# You can put as many as you like, separated by a pipe.
WHITE_LIST='directory_1|directory_2|directory_3'

ls -1 $APP_DIR | grep --color=never -v "($WHITE_LIST)" > ~/$AG_IGNORE_FILE
