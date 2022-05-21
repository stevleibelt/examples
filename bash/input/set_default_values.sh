#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-04-25
####

function _example()
{
    VAR=${1:-'foo'}
    FOO=${2:-''}

    echo "\$VAR: ${VAR}"
    echo "\$FOO: ${FOO}"
}

_example ${@}
