#!/bin/bash
####
# Only start a process if it is not running
#
# @since 2018-09-11
# @author stev leibelt <artodeto@bazzline.net>
####

LEVEL_OF_VERBOSITY=0
SHOW_HELP=0

while true;
do
    case "${1}" in
        -h)
            SHOW_HELP=1
            shift
            ;;
        -v)
            LEVEL_OF_VERBOSITY=1
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [[ ${SHOW_HELP} -eq 1 ]];
then
    echo ":: Usage"
    echo "   ${BASH_SOURCE[0]} [-h] [-v]"

    exit 0
fi

declare -a LIST_OF_PROCESS_TO_SUPERVISE=( 
    "echo 'foo bar foobar'"
    "echo 'there is no foo' && sleep 3 && echo 'without a bar'"
    "sleep 10"
    "echo \"tralala\""
 )

for PROCESS_TO_SUPERVISE in "${LIST_OF_PROCESS_TO_SUPERVISE[@]}"
do
    if [[ ${LEVEL_OF_VERBOSITY} -gt 0 ]];
    then
        echo ":: Supervising process >>${PROCESS_TO_SUPERVISE}<<."
    fi
    NUMBER_OF_RUNNING_PROCESSES=$(pgrep -cif "${PROCESS_TO_SUPERVISE}")
    #pgrep -cif "${PROCESS_TO_SUPERVISE}"
    if [[ ${LEVEL_OF_VERBOSITY} -gt 0 ]];
    then
        echo "   Number of running processes >>${NUMBER_OF_RUNNING_PROCESSES}<<."
    fi

    if [[ ${NUMBER_OF_RUNNING_PROCESSES} -eq 0 ]];
    then
        if [[ ${LEVEL_OF_VERBOSITY} -gt 0 ]];
        then
            echo "   Starting not running process >>${PROCESS_TO_SUPERVISE}<<."
        fi
        nohup ${PROCESS_TO_SUPERVISE} >> supervise_process.log 2>&1 &
    else
        if [[ ${LEVEL_OF_VERBOSITY} -gt 0 ]];
        then
            echo "   Is running >>${PROCESS_TO_SUPERVISE}<<."
        fi
    fi
done;
