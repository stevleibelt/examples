#!/bin/bash
####
# how to react on executed commands return code
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2022-02-07
####

function _call_exit ()
{
    local EXIT_CODE="${1:-0}"

    exit ${EXIT_CODE}
}

function _main ()
{
    echo ":: Begin of main function"

    echo "   calling _call_exit"
    _call_exit

    echo "   calling _call_exit 2"
    _call_exit 2

    echo ":: End of main function"
}

_main
