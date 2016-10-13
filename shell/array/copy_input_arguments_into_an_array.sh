#!/bin/bash
########
# @author stevleibelt
# @since 2016-04-04
########

LOCAL_ARRAY=( "$@" )

echo ":: Outputting your provided arguments"

for LOCAL_VARIABLE in "${LOCAL_ARRAY[@]}";
do
    echo "   ${LOCAL_VARIABLE}"
done
