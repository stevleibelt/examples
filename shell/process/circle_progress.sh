#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-29
# @see
#   http://unix.stackexchange.com/questions/76717/bash-launch-background-process-and-check-when-it-ends
####

SCRIPT_PATH=$(cd $(dirname "$0"); pwd)
FILE_NAME_BASE='/tmp/circle_progress_'$$'_'

FILE_NAME_PROCESS_ONE=${FILE_NAME_BASE}'1'
bash ${SCRIPT_PATH}/sleepy_process.sh 5 ${FILE_NAME_PROCESS_ONE} "silent" &

FILE_NAME_PROCESS_TWO=${FILE_NAME_BASE}'2'
bash ${SCRIPT_PATH}/sleepy_process.sh 4 ${FILE_NAME_PROCESS_TWO} "silent" &

ITERATOR=0;
AT_LEAST_ONE_PROCESS_IS_STILL_RUNNING=1

# storeCursorPosition
printf "\033[s"

sleep 0.5

while [[ ${AT_LEAST_ONE_PROCESS_IS_STILL_RUNNING} -eq 1 ]];
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

    if [ -f $FILE_NAME_PROCESS_ONE ] || [ -f $FILE_NAME_PROCESS_TWO ]; then
        AT_LEAST_ONE_PROCESS_IS_STILL_RUNNING=1
    else
        AT_LEAST_ONE_PROCESS_IS_STILL_RUNNING=0
    fi

    sleep 0.5
done

printf "\033[K"
echo ""
echo "done"
