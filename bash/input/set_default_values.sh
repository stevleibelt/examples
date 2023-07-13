#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-04-25
####

function _example()
{
    local VAR
    local FOO
    local FOZ
    local BAR
    local BAZ

    VAR=${1:-'foo'}
    FOO=${2:-''}
    FOZ=${3:-${VAR}}
    BAR=${4:-3}
    BAZ=${5}

    echo "\$VAR >>${VAR}<<."
    echo "\$FOO >>${FOO}<<."
    echo "\$FOZ >>${FOZ}<<."
    echo "\$BAR >>${BAR}<<."

    if [[ -z "${BAZ}" ]];
    then
      echo "\$BAZ is not set"
    else
      echo "\$BAZ >>${BAZ}<<."
    fi
}

_example "${@}"
