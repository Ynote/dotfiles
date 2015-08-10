#!/bin/sh

source ~/bin/variables.sh

GREEN='\033[0;32m'
GREY='\033[1;30m'
YELLOW='\033[1;33m'
NC='\033[0m' # no color

case "$1" in
'start')
echo "${GREEN}=============================="
echo "      Start processes"
echo "==============================${GREY}"
echo "Starting client Grunt..."
grunt --base ~/web/$LD_CLIENT_PATH --gruntfile ~/web/$LD_CLIENT_GRUNTFILE serve 2>&1 > ~/web/logs/$LD_CLIENT_LOGS_FILE &
echo "Starting dashboard Grunt..."
cd ~/web/$LD_DASHBOARD_PATH && ./run.sh 2>&1 > ~/web/logs/$LD_DASHBOARD_LOGS_FILE &
echo "Starting Rails...${NC}"
cd ~/web/$LD_SERVER_PATH && bundle exec rails s 2>&1 > ~/web/logs/$LD_SERVER_LOGS_FILE &
;;

'stop')
echo "${YELLOW}==========================="
echo "      Stop processes"
echo "===========================${GREY}"
echo "Stopping local Grunt..."
pkill grunt
echo "Stopping local Node"
ps auxw | grep '[n]ode' | grep '[8]081' | awk '{print$2}' | xargs kill
echo "Stopping local Rails${NC}"
ps auxw | grep '[r]uby' | grep '[r]ails' | awk '{print$2}' | xargs kill
;;

*)
echo "usage: $0 start|stop"
exit 1
;;

esac
