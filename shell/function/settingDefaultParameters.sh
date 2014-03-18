#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-18
####

function settingDefaultParameters()
{
    case "$1" in
        ".") DIRECTORY=".";;
        "..") DIRECTORY="..";;
        *) DIRECTORY="."
    esac
    ls -halt "$DIRECTORY"
}

settingDefaultParameters
