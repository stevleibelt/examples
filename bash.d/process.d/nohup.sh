#!/bin/bash
####
# launch_background_process_and_wait_until_it_ends
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-09-18
# @see
#   https://www.computerhope.com/unix/unohup.htm
####

#enable bash job support (fg & bg)
set -o monitor

SCRIPT_PATH=$(cd $(dirname "$0"); pwd)

if [[ -f nohup.out ]];
then
    rm nohup.out
fi

#all processes are started in the background
#as bash script
nohup bash -c "${SCRIPT_PATH}/sleepy_process.sh 2" &
PID_ONE=$!

#redirecting output to a log file
nohup ${SCRIPT_PATH}/sleepy_process.sh 3 >> nohup.out &
PID_TWO=$!

#just default
nohup ${SCRIPT_PATH}/sleepy_process.sh 5 &
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
echo ":: All background processes are done."

if [[ -f nohup.out ]];
then
    echo ":: Dumping nohup.out before deleting it."
    cat nohup.out
    rm nohup.out
fi

