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
    local RANDOM_STRING_WITH_CHECKSUM
    local RANDOM_STRING_WITH_TR
    local STRING_LENGTH

    STRING_LENGTH="${1:-4}"

    RANDOM_STRING_WITH_CHECKSUM=$(echo ${RANDOM} | sha512sum | head -c ${STRING_LENGTH})
    RANDOM_STRING_WITH_TR=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c ${STRING_LENGTH})

    echo ":: Created random string with >>${STRING_LENGTH}<< characters."
    echo "   With checksum: >>${RANDOM_STRING_WITH_CHECKSUM}<<."
    echo "   With tr: >>${RANDOM_STRING_WITH_TR}<<."
}

_main "${@}"
