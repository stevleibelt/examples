#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2022-03-24
####

function _example()
{
    VAR=${1:?Must provide argument}

    echo "\$VAR: ${VAR}"
}

_example "${@}"
