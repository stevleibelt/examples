#!/bin/bash
####
# @see
#   https://github.com/zbm-dev/zfsbootmenu/blob/master/zbm-builder.sh
#   https://stackoverflow.com/questions/402377/using-getopts-in-bash-shell-script-to-get-long-and-short-command-line-options
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

####
# @param <string: symbole_of_the_argument>
# @param <string: content_of_the_argument>
####
function _print_argument_was_provided () {
    echo ":: Flag >>${1}<< was provided."
    echo "   Provided content is >>${2}<<"
}

####
# @param <string: symbole_of_the_flag>
####
function _print_flag_is_used () {
    echo ":: Flag >>${1}<< was used."
}

function _main () {
    local FLAG_A_IS_ENABLED
    local FLAG_B_IS_ENABLED
    local FLAG_C_IS_ENABLED
    local ARGUMENT_D_IS_USED
    local ARGUMENT_D_CONTENT
    local SHOW_USAGE

    FLAG_A_IS_ENABLED=0
    FLAG_B_IS_ENABLED=0
    FLAG_C_IS_ENABLED=0
    ARGUMENT_D_IS_USED=0
    ARGUMENT_D_CONTENT=""
    SHOW_USAGE=0

    #a, b and c are simple flags
    #d has an argument
    #if you put this into a function, you have to provide the function the arguments like <function name> $@
    while getopts "abcd:h" CURRENT_OPTION;
    do
        case ${CURRENT_OPTION} in
            a)
                _print_flag_is_used "a"
                ;;
            b)
                _print_flag_is_used "b"
                ;;
            c)
                _print_flag_is_used "c"
                ;;
            d)
                _print_argument_was_provided "d" "${OPTARG}"
                ;;
            h)
                SHOW_USAGE=1
                ;;
        esac
    done

    if [[ ${SHOW_USAGE} -eq 1 ]];
    then
        echo ":: Usage"
        echo "   <command> [-a] [-b] [-c] [-d <argument>]"
    fi
}

_main "${@}"
