#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 20220-08-19
####

function _main ()
{
    local ANSWER

    read -p "> Input something " -r
    ANSWER="${REPLY:-default}"

    echo ":: Your answer was."
    echo "   >>${ANSWER}<<."
}

_main "${@}"
