#!/bin/bash
####
# Example of how to use heredoc
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-26
# @see
#   http://www.cyberciti.biz/faq/linux-unix-sleep-bash-scripting/
####

function echoDate ()
{
    echo $(date +'%Y-%m-%d %H:%M:%S')
}

function _main ()
{

    echoDate
    echo ":: Sleep for 1 second"
    sleep 1s
    #also valid
    #sleep 1
    echoDate
    echo ""

    echoDate
    echo ":: Sleep for 5 second"
    sleep 5s
    echoDate
    echo ""

    echoDate
    echo ":: Sleep for 1 minute"
    sleep 1m
    echoDate
    echo ""

    echoDate
    echo ":: Sleep for 1 hour"
    sleep 1h
    echoDate
    echo ""

    echoDate
    echo ":: Sleep for 1 day"
    sleep 1d
    echoDate
    echo ""
}

_main
