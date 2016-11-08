#!/bin/bash
####
# launch_background_process_and_wait_until_it_ends
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-29
# @see
#   http://unix.stackexchange.com/questions/76717/bash-launch-background-process-and-check-when-it-ends
####

#enable bash job support (fg & bg)
set -o monitor

SCRIPT_PATH=$(cd $(dirname "$0"); pwd)

bash ${SCRIPT_PATH}/sleepy_process.sh 2 &
PID_ONE=$!

bash ${SCRIPT_PATH}/sleepy_process.sh 3 &
PID_TWO=$!

bash ${SCRIPT_PATH}/sleepy_process.sh 5 &
PID_THREE=$!

wait ${PID_ONE}
echo ""
echo "PID ONE has ended"

#begin of keeping the session alive
echo ""
ITERATOR=0;

#store current curser position
printf "\033[s"

#run until the pid is not detected anymore
while ps -p ${PID_THREE} | grep -q ${PID_THREE};
do
    if [[ ${ITERATOR} -eq 0 ]];
    then 
        ((++ITERATOR))
        printf "\033[u[-]"
    elif [[ ${ITERATOR} -eq 1 ]];
    then
        ((++ITERATOR))
        printf "\033[u[\]"
    elif [[ $ITERATOR -eq 2 ]];
    then
        ((++ITERATOR))
        printf "\033[u[|]"
    else
        ITERATOR=0
        printf "\033[u[/]"
    fi

    sleep 0.5
done;
printf "\033[K"
#end of keeping the session alive

wait
echo ""
echo 'all background processes are done'
