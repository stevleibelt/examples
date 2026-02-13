#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-04-25
####

function _example()
{
    local BAR
    local BAZ
    local FILTER_PATTERN
    local FOO
    local FOZ
    local VAR
    local WORKING_DIRECTORY

    VAR=${1:-'foo'}
    FOO=${2:-''}
    FOZ=${3:-${VAR}}
    BAR=${4:-3}
    BAZ=${5}
    WORKING_DIRECTORY="${6:-${PWD}}"
    FILTER_PATTERN="${7:-*}"

    echo "\$BAR >>${BAR}<<."
    echo "\$FILTER_PATTERN >>${FILTER_PATTERN}<<."
    echo "\$FOO >>${FOO}<<."
    echo "\$FOZ >>${FOZ}<<."
    echo "\$VAR >>${VAR}<<."
    echo "\$WORKING_DIRECTORY >>${WORKING_DIRECTORY}<<."

    if [[ -z "${BAZ}" ]];
    then
      echo "\$BAZ is not set"
    else
      echo "\$BAZ >>${BAZ}<<."
    fi
}

_example "${@}"
