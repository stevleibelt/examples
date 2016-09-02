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

bash $SCRIPT_PATH/sleepy_process.sh 2 &
PID_ONE=$!

bash $SCRIPT_PATH/sleepy_process.sh 3 &
PID_TWO=$!

echo "."
sleep 0.5
echo "."

wait $PID_ONE
echo 'PID ONE has ended'

echo "."
sleep 0.5
echo "."

wait
echo 'all background processes are done'
