#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-29
####

if [[ $# -eq 0 ]]; then
    echo 'No arguments supplied'
    echo 'usage:'
    echo '<command> <seconds to run>'
    exit 1
fi

SECONDS_TO_RUN="$1"

echo 'sleeping for '$SECONDS_TO_RUN
sleep $SECONDS_TO_RUN
echo 'finished'
