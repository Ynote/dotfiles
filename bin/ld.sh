#!/bin/sh

source ~/scripts/variables.sh

case "$1" in
'start')
echo "Starting Grunt..."
grunt --base ~/web/$LD_CLIENT_PATH --gruntfile ~/web/$LD_CLIENT_GRUNTFILE serve 2>&1 > ~/web/logs/$LD_CLIENT_LOGS_FILE &
echo "Starting Rails..."
cd ~/web/$LD_SERVER_PATH && bundle exec rails s 2>&1 > ~/web/logs/$LD_SERVER_LOGS_FILE &
;;

'stop')
echo "Stopping Grunt..."
pkill grunt
echo "Stopping Rails"
ps auxw | grep '[r]uby' | grep '[r]ails' | awk '{print$2}' | xargs kill
;;

*)
echo "usage: $0 start|stop"
exit 1
;;

esac
