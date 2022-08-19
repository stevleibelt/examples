#!/bin/bash
####
# simple example how to ask yes or now questions in a bash environment
#
# @see
#   http://www.shellhacks.com/en/Yes-No-in-Bash-Script-Prompt-for-Confirmation
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-07-01
####

function _ask_with_if ()
{
    if echo "${1:-n}" | grep -iq '^y$';
    then
        echo "   Yes"
    else
        echo "   No"
    fi
}

function _ask_with_case ()
{
    while true; do
        case ${1:-n} in
            [Yy]* ) 
                echo "   Go on and hug someone who looks sad"
                break;;
            [Nn]* )
                echo "   Go on and get a hug from someone"
                break;;
            * )
                echo "   Please input y or n."
                break;;
        esac
    done
}

function _ask_with_input ()
{
    read -p "> Once again, {y|Y} or {n|N}? " -r

    if [[ ${REPLY} =~ ^[Yy]$  ]];
    then
        echo "   YES!"
    else
        echo "   NO!"
    fi
}

_ask_with_if ${1}
_ask_with_case ${1}
_ask_with_input
