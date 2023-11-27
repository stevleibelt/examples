#!/bin/sh
########
# @author stevleibelt
# @since 2022-02-18
########

function _main ()
{
    local IP_ADDRESS_TO_TEST="${1:-'127.0.0.1'}"

    ping -c 1 "${IP_ADDRESS_TO_TEST}" &> /dev/null

    if [[ "$?" -eq 0 ]];
    then
        echo "IP Address >>${IP_ADDRESS_TO_TEST}<< is online."
    else
        echo "IP Address >>${IP_ADDRESS_TO_TEST}<< is offline."
    fi
}

_main $*
