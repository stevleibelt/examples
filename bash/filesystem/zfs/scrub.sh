#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-03-12
####

if [[ $# -lt 1 ]]; then
    echo "no arugments supplied"
    echo "usage: <command> <name of the zpool"

    exit 1
fi

LOCAL_ZPOOL_NAME="$1"
LOCAL_NUMBER_OF_FITTING_MOUNTED_ZPOOLS=$(zpool list | grep $LOCAL_ZPOOL_NAME | wc -l)

if [[ $LOCAL_NUMBER_OF_FITTING_MOUNTED_ZPOOLS -eq 1 ]]; then
    zpool scrub $LOCAL_ZPOOL_NAME
elif
    echo "found "$LOCAL_NUMBER_OF_FITTING_MOUNTED_ZPOOLS" mounted and fitting zpools by the name "$LOCAL_ZPOOL_NAME
    echo "nothing is scrubbed"

    exit 1
fi
