#!/bin/bash
####
# Just print dots
####
# @since: 2022-02-12
# @author: Stev Leibelt <artodeto@bazzline.net>
####

function _main ()
{
    #two ways, either start by one
    #_or wrap the whole modulo check with another if [[ ${CURRENT_NUMBER_OF_PRINTED_DOTS} -gt 0 ]] check
    CURRENT_NUMBER_OF_PRINTED_DOTS=1

    while true;
    do
        if [[ $(calc ${CURRENT_NUMBER_OF_PRINTED_DOTS} % 20 ) -eq 0 ]];
        then
            echo "."
        else
            echo -n "."
        fi

        CURRENT_NUMBER_OF_PRINTED_DOTS=$(calc ${CURRENT_NUMBER_OF_PRINTED_DOTS} + 1)

        sleep 0.5
    done
}

_main
