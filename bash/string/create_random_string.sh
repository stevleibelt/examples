#!/bin/bash
####
# Generates a randomstring.
# I am using it to generate "uniq" zfs pools like "foo-a3nf".
####
# @since 20220626T15:19:20
# @author stev leibelt <artodeto@bazzline.net>
####

function _main ()
{
    local STRING_LENGTH="${1:-4}"

    local CREATED_RANDOM_STRING=$(echo ${RANDOM} | sha512sum | head -c ${STRING_LENGTH})

    echo ":: Created random string with >>${STRING_LENGTH}<< characters."
    echo "   >>${CREATED_RANDOM_STRING}<<."
}

_main $@
