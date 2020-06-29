#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-09-03
####

IS_DRY_RUN=0

function execute_or_output_command_call ()
{
    if [[ $IS_DRY_RUN -eq 1 ]];
    then
        echo "$1"
    else
        $1
    fi
}

execute_or_output_command_call "echo \"foo\""
IS_DRY_RUN=1
execute_or_output_command_call "echo \"foo\""
