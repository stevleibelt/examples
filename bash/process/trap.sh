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
    echo "handle_sigterm executed"
}

trap "handle_sigterm" SIGTERM
trap "echo \"SIGINT or SIGSTP received\"" SIGINT SIGHUP

echo "sleeping for 30 seconds"
sleep 30
