#!/bin/sh
########
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-04-07
# @see http://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty/
########

if [[ $# -eq 0 ]]
then
    LOCAL_PATH_TO_THE_DIRECTORY="."
else
    LOCAL_PATH_TO_THE_DIRECTORY="$1"
fi

echo ":: using path $LOCAL_PATH_TO_THE_DIRECTORY"

if [[ "$(ls -A $LOCAL_PATH_TO_THE_DIRECTORY)" ]]
then
    echo ":: directory is not empty"
else
    echo ":: directory is empty"
fi
