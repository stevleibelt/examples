#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-05
####

function _main ()
{
    echo ":: Enter something."
    read VALUE

    echo ":: You have entered the following value."
    echo "   >>${VALUE}<<"
    echo ""

    echo ":: Please enter a path. Path completion is enabled."
    read -e FILE_PATH

    echo ":: You have entered the following value."
    echo "   >>${FILE_PATH}<<"
    if [[ ! -f "${FILE_PATH}" ]];
    then
        echo "   File path does not exist!"
    fi
    echo ""
}

_main
