#!/bin/bash
####
# @see
#   https://stackoverflow.com/questions/402377/using-getopts-in-bash-shell-script-to-get-long-and-short-command-line-options
#   https://opensource.com/article/21/5/launch-flatpaks-linux-terminal
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-08-13
####

CONTENT_OF_ARGUMENT_D=""
FLAG_A_IS_ENABLED=0
FLAG_B_IS_ENABLED=0
FLAG_C_IS_ENABLED=0
SHOW_USAGE=1

#a, b and c are simple flags
#d has an argument
#if you put this into a function, you have to provide the function the arguments like <function name> $@
while true;
do
    case "${1}" in
        -a )
            FLAG_A_IS_ENABLED=1
            shift 1
            ;;
        -b )
            FLAG_B_IS_ENABLED=1
            shift 1
            ;;
        -c )
            FLAG_C_IS_ENABLED=1
            shift 1
            ;;
        -d )
            CONTENT_OF_ARGUMENT_D="${2}"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done

if [[ ${FLAG_A_IS_ENABLED} -eq 1 ]];
then
    echo ":: Flag a was provided"
    SHOW_USAGE=0
fi

if [[ ${FLAG_B_IS_ENABLED} -eq 1 ]];
then
    echo ":: Flag b was provided"
    SHOW_USAGE=0
fi

if [[ ${FLAG_C_IS_ENABLED} -eq 1 ]];
then
    echo ":: Flag c was provided"
    SHOW_USAGE=0
fi

if [[ ${CONTENT_OF_ARGUMENT_D} != "" ]];
then
    echo ":: Content after -d."
    echo "   >>${CONTENT_OF_ARGUMENT_D}<<"
    SHOW_USAGE=0
fi

if [[ ${SHOW_USAGE} -eq 1 ]];
then
    echo ":: Usage"
    echo "   <command> [-a] [-b] [-c] [-d \"<content>\"]"
fi
