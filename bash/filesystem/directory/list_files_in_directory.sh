#!/bin/bash
####
# @since 2018-11-20
# @author stev leibelt <artodeto@bazzline.net>
####

function main ()
{
    local FILE_PATH='';

    find . -name "*.sh" -type f | while read FILE_PATH;
    do
        echo "   ${FILE_PATH}";
    done;
}

main $@
