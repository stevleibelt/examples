#!/bin/bash
####
# Compares a string case insensitive. Works in sh too!
# @see:
#   https://unix.stackexchange.com/a/132481
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2022-03-01
####

####
# @param: <string: first string>
# @param: <string: second string>
####
function test_strings_are_equal ()
{
    #we have to compare the size of strings to prevent marking
    # the second string >>fo<< as equal to the first string >>foo<<
    if [ ${#1} -eq ${#2} ];
    then
        if echo ${1} | grep -iqF ${2};
        then
            return 0
        fi
    fi

    return 1
}

function _main ()
{
    local FIRST_STRING
    local SECOND_STRING

    FIRST_STRING="${1:-foo}"
    SECOND_STRING="${2:-FOO}"

    if test_strings_are_equal "${FIRST_STRING}" "${SECOND_STRING}";
    then
        echo ":: String >>${FIRST_STRING}<< and >>${SECOND_STRING}<< are equal compared case insensitive."
    else
        echo ":: String >>${FIRST_STRING}<< and >>${SECOND_STRING}<< are different, event compared case insensitive."
    fi
}

_main "${@}"

