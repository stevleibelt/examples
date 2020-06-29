#!/bin/bash
####
# @see
#   https://stackoverflow.com/questions/402377/using-getopts-in-bash-shell-script-to-get-long-and-short-command-line-options
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

CONTENT_OF_ARGUMENT_D=""
FLAG_A_IS_ENABLED=0
FLAG_B_IS_ENABLED=0
FLAG_C_IS_ENABLED=0
SHOW_USAGE=1

#a, b and c are simple flags
#d has an argument
#if you put this into a function, you have to provide the function the arguments like <function name> $@
while getopts "abcd:" CURRENT_OPTION;
do
    case ${CURRENT_OPTION} in
        a )
            FLAG_A_IS_ENABLED=1
            ;;
        b )
            FLAG_B_IS_ENABLED=1
            ;;
        c )
            FLAG_C_IS_ENABLED=1
            ;;
    esac
done

if [[ ${FLAG_A_IS_ENABLED} -eq 1 ]];
then
    echo "flag a was provided"
    SHOW_USAGE=0
fi

if [[ ${FLAG_B_IS_ENABLED} -eq 1 ]];
then
    echo "flag b was provided"
    SHOW_USAGE=0
fi

if [[ ${FLAG_C_IS_ENABLED} -eq 1 ]];
then
    echo "flag c was provided"
    SHOW_USAGE=0
fi

if [[ ${SHOW_USAGE} -eq 1 ]];
then
    echo ":: Usage"
    echo "   <command> [-a] [-b] [-c]"
fi
