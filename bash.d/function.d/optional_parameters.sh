#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-23
####

function optionalParameters()
{
    case ${#} in
        2)
            PARAMETER_ONE="${1}"
            PARAMETER_TWO="${2}"

            echo ":: outputting parameters."
            echo "   parameter one: ${PARAMETER_ONE}"
            echo "   parameter two: ${PARAMETER_TWO}"
            ;;
        3)
            OPTION="${1}"
            PARAMETER_ONE="${2}"
            PARAMETER_TWO="${3}"

            echo ":: outputting parameters."
            echo "   parameter one: ${PARAMETER_ONE}"
            echo "   parameter two: ${PARAMETER_TWO}"
            ;;
        *)
            echo ":: Usage: ${0} [-option] <parameter one> <parameter two>"
            exit 1
            ;;
    esac
}

optionalParameters "${@}"
