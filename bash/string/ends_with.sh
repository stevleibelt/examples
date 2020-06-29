#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-01-09
####

####
# @param string haystack
# @param string needle
####
function string_ends_with ()
{
    if [[ $# -eq 2 ]];
    then
        local STRING="$1"
        local SUB_STRING="$2"
        local LENGTH_OF_SUB_STRING=${#SUB_STRING}
        local STRING_WITH_SUB_STRING_ONLY=${STRING: -$LENGTH_OF_SUB_STRING}

        if [[ ${STRING_WITH_SUB_STRING_ONLY} == ${SUB_STRING} ]];
        then
            return 0
        else
            return 1
        fi
    else
        echo "Usage:"
        echo "   string_ends_with <string> <needle>"
        return 1
    fi
}

declare -a LIST_OF_STRINGS=( "there is no foo without a bar" "there is a foo" "there is a bar" "no foo" "no bar" "foobar" )
STRING_TO_CHECK_FOR=" bar"

for STRING in "${LIST_OF_STRINGS[@]}";
do
    echo "The string \"${STRING}\""

    if string_ends_with "${STRING}" "${STRING_TO_CHECK_FOR}"
    then
        echo "    ends with \"${STRING_TO_CHECK_FOR}\""
    else
        echo "    does not ends with \"${STRING_TO_CHECK_FOR}\""
    fi
done
