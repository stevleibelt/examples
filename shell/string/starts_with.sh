#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-10-13
# @see
#   http://stackoverflow.com/a/2172364
#   http://www.tldp.org/LDP/abs/html/string-manipulation.html
####

declare -a LIST_OF_STRINGS=( "there is no foo without a bar" "there is a foo" "there is a bar" "no foo" "no bar" "foobar" )
STRING_TO_CHECK_FOR="there is"

LENGTH_OF_THE_STRING_TO_CHECK_FOR=${#STRING_TO_CHECK_FOR}

for STRING in "${LIST_OF_STRINGS[@]}";
do
    SUBSTRING="${STRING:0:${LENGTH_OF_THE_STRING_TO_CHECK_FOR}}"

    echo "The string \"${STRING}\""

    if [[ "${SUBSTRING}" == "${STRING_TO_CHECK_FOR}" ]];
    then
        echo "    starts with \"${STRING_TO_CHECK_FOR}\""
    else
        echo "    does not starts with \"${STRING_TO_CHECK_FOR}\""
    fi
done
