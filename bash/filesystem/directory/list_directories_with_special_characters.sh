#!/bin/bash
####
# @link https://stackoverflow.com/questions/301039/how-can-i-escape-white-space-in-a-bash-loop-list
# @author stev leibelt <artodeto@bazzline.net>
# @since 2017-09-27
####

find . -type d -print0 | while read -d $'\0' DIRECTORY_PATH;
do
    #remove the "./" from the search result of find
    DIRECTORY_NAME=${DIRECTORY_PATH:2}
    if [[ -d "${DIRECTORY_NAME}" ]];
    then
        echo "   ${DIRECTORY_NAME}"
    fi
done;
