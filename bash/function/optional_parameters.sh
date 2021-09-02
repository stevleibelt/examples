#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-23
####

function optionalParameters()
{
    case $# in
        2)  parameterOne=$1
            parameterTwo=$2
            echo 'parameter one: '$parameterOne
            echo 'parameter two: '$parameterTwo
            ;;
        3)  option=$1
            parameterOne=$2
            parameterTwo=$3
            echo 'option: '$option
            echo 'parameter one: '$parameterOne
            echo 'parameter two: '$parameterTwo
            ;;
        *)  echo 'Usage: '$0' [-option] <parameter one> <parameter two>'
            exit 1
            ;;
    esac
}

optionalParameters "$@"
