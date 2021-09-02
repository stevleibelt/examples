#!/bin/bash
####
# @see
#   https://stackoverflow.com/questions/402377/using-getopts-in-bash-shell-script-to-get-long-and-short-command-line-options
#   https://opensource.com/article/21/5/launch-flatpaks-linux-terminal
#   https://opensource.com/article/21/8/option-parsing-bash
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-08-13
####

function _net_bazzline_example_bash_input_getopt ()
{
    local CONTENT_OF_ARGUMENT_D=""
    local FLAG_A_IS_ENABLED=0
    local FLAG_B_IS_ENABLED=0
    local FLAG_C_IS_ENABLED=0
    local SHOW_USAGE=1

    #a, b and c are simple flags
    #d has an argument
    #if you put this into a function, you have to provide the function the arguments like <function name> $@
    while true;
    do
        case "${1}" in
            "-a" | "--alpha" )  #as you can see, you can put "-a" in \" or not
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
            -d | "--delta")
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
        echo ":: Flag -a or --alpha was provided"
        SHOW_USAGE=0
    fi

    if [[ ${FLAG_B_IS_ENABLED} -eq 1 ]];
    then
        echo ":: Flag -b was provided"
        SHOW_USAGE=0
    fi

    if [[ ${FLAG_C_IS_ENABLED} -eq 1 ]];
    then
        echo ":: Flag -c was provided"
        SHOW_USAGE=0
    fi

    if [[ ${CONTENT_OF_ARGUMENT_D} != "" ]];
    then
        echo ":: Content after -d or --delta ."
        echo "   >>${CONTENT_OF_ARGUMENT_D}<<"
        SHOW_USAGE=0
    fi

    if [[ $# -gt 0 ]];
    then
        echo ":: Dumping ${#} arguments."

        for CURRENT_ARGUMENT in ${@}; do
            echo "   >>${CURRENT_ARGUMENT}<<"
        done

        SHOW_USAGE=0
    fi

    if [[ ${SHOW_USAGE} -eq 1 ]];
    then
        echo ":: Usage"
        echo "   <command> [-a|--alpha] [-b] [-c] [-d \"<content>\"|--delta=\"<content>\"]"
    fi
}

_net_bazzline_example_bash_input_getopt ${@}
