#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-18
####

function bypassAllParameters()
{
    ls -halt "$@"
}

bypassAllParameters .
