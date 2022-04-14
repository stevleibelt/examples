#!/bin/bash
####
# @see:
#   http://www.tldp.org/LDP/abs/html/string-manipulation.html
#   https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
#   http://www.softpanorama.org/Scripting/Shellorama/Reference/string_operations_in_shell.shtml#Index
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-11-15
####

function string_is_empty ()
{
    if [[ "${#1}" -eq 0 ]];
    then
        return 0
    else
        return 1
    fi
}

function _main ()
{
    if string_is_empty 
    then
        echo ":: No value is empty"
    else
        echo ":: No value is not empty"
    fi

    if string_is_empty ""
    then
        echo ":: \"\" is empty string"
    else
        echo ":: \"\" is not empty"
    fi

    if string_is_empty "bazzline"
    then
        echo ":: \"bazzline\" is empty"
    else
        echo ":: \"bazzline\" is not string"
    fi
}

_main
