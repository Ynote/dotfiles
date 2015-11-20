#!/bin/sh

source ~/bin/variables.sh

GREEN='\033[0;32m'
GREY='\033[1;30m'
YELLOW='\033[1;33m'
NC='\033[0m' # no color

case "$1" in
'server')
echo "${GREEN}Starting Rails...${NC}"
cd ~/web/$LD_SERVER_PATH && bundle exec rails s -p 3002 2>&1 > ~/web/ngrok/logs/$LD_SERVER_LOGS_FILE &
;;

'client')
echo "${GREEN}Starting client Grunt...${NC}"
cd ~/web/ngrok/$LD_CLIENT_PATH && make && grunt serve --port=8090 2>&1 > ~/web/ngrok/logs/$LD_CLIENT_LOGS_FILE &
echo "${GREEN}Starting dashboard Grunt...${NC}"
cd ~/web/ngrok/$LD_DASHBOARD_PATH && make && grunt serve --port=8091 2>&1 > ~/web/ngrok/logs/$LD_DASHBOARD_LOGS_FILE &
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
echo "usage: $0 server|client|stop"
exit 1
;;

esac
