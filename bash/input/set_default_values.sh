#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-04-25
####

function _example()
{
    local VAR=${1:-'foo'}
    local FOO=${2:-''}
    local BAR=${3:-3}

    echo "\$VAR >>${VAR}<<."
    echo "\$FOO >>${FOO}<<."
    echo "\$BAR >>${BAR}<<."
}

_example ${@}
