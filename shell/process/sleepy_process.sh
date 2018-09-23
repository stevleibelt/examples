#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-29
####

if [[ $# -eq 0 ]];
then
    echo 'No arguments supplied'
    echo 'usage:'
    echo '<command> <seconds to run>'
    exit 1
fi

SECONDS_TO_RUN="${1}"

if [[ $# -gt 1 ]];
then
    HAS_FILE_NAME=1
    FILE_NAME="${2}"
else
    HAS_FILE_NAME=0
fi

BE_VERBOSE=1

if [[ $# -gt 2 ]];
then
    if [[ "${3}" == "silent" ]];
    then
        BE_VERBOSE=0
    fi
fi

if [[ ${BE_VERBOSE} -eq 1 ]];
then
    echo "sleeping for ${SECONDS_TO_RUN}"
fi

if [[ ${HAS_FILE_NAME} -eq 1 ]];
then
    touch ${FILE_NAME}
fi

sleep ${SECONDS_TO_RUN}

if [[ ${HAS_FILE_NAME} -eq 1 ]];
then
    rm ${FILE_NAME}
fi

if [[ ${BE_VERBOSE} -eq 1 ]];
then
    echo 'finished'
fi
