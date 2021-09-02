#!/bin/bash
####
# Demonstrates how local variable scope is working
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2021-09-02
####

function _first_level_function ()
{
    local FIRST_LEVEL_VARIABLE="foo"
    local JUST_AN_ECHO=$(_just_an_echo)

    echo ":: ${LINENO} - ${GLOBAL_VARIABLE}"
    _second_level_function

    echo ":: Is there a >>${FIRST_LEVEL_VARIABLE}<< without a >>${SECOND_LEVEL_VARIABLE}<<?"
    echo ":: ${LINENO} - ${GLOBAL_VARIABLE}"
    echo ":: ${JUST_AN_ECHO}"
}

function _second_level_function ()
{
    GLOBAL_VARIABLE="foobar"
    local SECOND_LEVEL_VARIABLE="bar"

    echo ":: There is no >>${FIRST_LEVEL_VARIABLE}<< without a >>${SECOND_LEVEL_VARIABLE}<<."
}

function _just_an_echo ()
{
    echo "baz"
}

echo ":: ${LINENO} - ${GLOBAL_VARIABLE}"
_first_level_function
echo ":: ${LINENO} - ${GLOBAL_VARIABLE}"
