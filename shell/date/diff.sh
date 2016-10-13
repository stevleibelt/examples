#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-26
########

if [ "$#" -gt 0 ]; then
    SLEEP="$1"
else
    SLEEP=7
fi

START_TIMESTAMP=$(date +'%s')
echo "sleeping for ${SLEEP} seconds"
sleep "${SLEEP}s"
END_TIMESTAMP=$(date +'%s')
DIFF=$(($END_TIMESTAMP-$START_TIMESTAMP))

echo "Runtime: ${DIFF} in seconds"
