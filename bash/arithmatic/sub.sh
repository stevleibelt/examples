#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

function _sub ()
{
    local ONE=1
    local RESULT=`expr 2 - ${ONE}`

    echo ":: 2 - 1 is >>${RESULT}<<"
}

_sub
