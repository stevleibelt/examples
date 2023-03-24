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
    local BAZ=${4}

    echo "\$VAR >>${VAR}<<."
    echo "\$FOO >>${FOO}<<."
    echo "\$BAR >>${BAR}<<."

    if [[ -z "${BAZ}" ]];
    then
      echo "\$BAZ is not set"
    else
      echo "\$BAZ >>${BAZ}<<."
    fi
}

_example ${@}
