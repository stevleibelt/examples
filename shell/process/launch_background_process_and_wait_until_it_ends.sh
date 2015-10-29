#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-29
# @see
#   http://unix.stackexchange.com/questions/76717/bash-launch-background-process-and-check-when-it-ends
####

SCRIPT_PATH=$(cd $(dirname "$0"); pwd)

bash $SCRIPT_PATH/sleepy_process.sh 2 &
PID_ONE=$!

bash $SCRIPT_PATH/sleepy_process.sh 3 &
PID_TWO=$!

wait $PID_ONE
echo 'PID ONE has ended'

wait
echo 'all background processes are done'
