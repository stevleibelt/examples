#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-10-26
# @see
#   https://linuxconfig.org/how-to-modify-scripts-behavior-on-signals-using-bash-traps
#   https://bash.cyberciti.biz/guide/Trap_statement
#   http://redsymbol.net/articles/bash-exit-traps/
#   http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html
####

function handle_sigterm ()
{
    echo "   function >>handle_sigterm<< executed. CTRL+Z pressed :-)."

    exit
}

function handle_sigint ()
{
    echo "   function >>handle_sigint<< executed. CTRL+C pressed :-)."

    let NUMBER_OF_HANDLED_SIGINT++
    echo

    if [[ ${NUMBER_OF_HANDLED_SIGINT} -eq 1  ]];
    then
        echo "   Please don't do this again."
    elif [[ ${NUMBER_OF_HANDLED_SIGINT} -eq 2  ]];
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
trap 'echo "   SIGTSTP received, stopping"; exit' SIGTSTP
trap handle_sigint SIGINT
trap 'echo "   SIGQUIT received, >>CTRL+D<< pressed, stopping"; exit' SIGQUIT
trap 'echo "   SIQKILL received, stopping"; exit' SIGKILL
trap 'echo "   ERR received"' ERR #if you add an >>; exit<< here, handle_sigint won't count up.
trap 'echo "   EXIT received, stopping."; exit' EXIT

echo ":: Listing all available signals by executing >>trap -l<<."
trap -l

#following would not work
#   while sleep 10
#the reason for that is that interrupted commands, like the `while sleep 10`, are not restarted after the trap is triggered.
while true
do
    SECONDS_TO_SLEEP=1
    echo ":: Sleeping for >>${SECONDS_TO_SLEEP}<< seconds"
    sleep ${SECONDS_TO_SLEEP}
done
