#!/bin/bash
####
# Only start a process if it is not running
#
# @since 2018-09-11
# @author stev leibelt <artodeto@bazzline.net>
####

declare -a LIST_OF_PROCESS_TO_SUPERVISE=( 
    "echo 'foo bar foobar'"
    "echo 'there is no foo' && sleep 3 && echo 'without a bar'"
    "sleep 10"
    "echo \"tralala\""
 )

for PROCESS_TO_SUPERVISE in "${LIST_OF_PROCESS_TO_SUPERVISE[@]}"
do
        #echo ":: ${PROCESS_TO_SUPERVISE}"
        NUMBER_OF_RUNNING_PROCESSES=$(pgrep -cif "${PROCESS_TO_SUPERVISE}")
        #pgrep -cif "${PROCESS_TO_SUPERVISE}"
        echo ":: number of running processes: ${NUMBER_OF_RUNNING_PROCESSES}"

        if [[ ${NUMBER_OF_RUNNING_PROCESSES} -eq 0 ]];
        then
                echo "   Process is not running, so I am starting it >>${PROCESS_TO_SUPERVISE}<<."
                nohup ${PROCESS_TO_SUPERVISE} >> supervise_process.log 2>&1 &
        fi
done;
