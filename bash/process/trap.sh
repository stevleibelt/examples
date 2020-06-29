#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-10-26
# @see
#   https://bash.cyberciti.biz/guide/Trap_statement
#   http://redsymbol.net/articles/bash-exit-traps/
#   http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html
####

function handle_sigterm ()
{
    echo "   function `handle_sigterm` executed. CTRL+Z pressed :-)."
}

function handle_sigint ()
{
    let NUMBER_OF_HANDLED_SIGINT++
    echo

    if [[ $NUMBER_OF_HANDLED_SIGINT == 1  ]];
    then
        echo "   Please don't do this again."
    elif [[ $NUMBER_OF_HANDLED_SIGINT == 2  ]];
    then
        echo "   Last warning, please stop this or I will stop it."
    else
        echo "   I quit."
        exit
    fi
}

trap handle_sigterm SIGTERM
#do not trap SIGKILL or SIGSTOP since it ends up in undefined results
#trap "echo \"   SIGSTOP received\"" SIGSTOP
#SIGTSTP is not working since the process is already sleeping
trap "echo \"   SIGTSTP received\"" SIGTSTP
trap handle_sigint SIGINT
trap "echo \"   ERR received\"" ERR
trap "echo \"   EXIT received\"" EXIT

#following would not work
#   while sleep 10
#the reason for that is that interrupted commands, like the `while sleep 10`, are not restarted after the trap is triggered.
while true
do
    echo ":: Sleeping for 30 seconds"
    sleep 30
done
