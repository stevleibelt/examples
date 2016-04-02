#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-04-25
####

# also good for iterate through all parameters
# also valid
#for var in "$@"; do
for PARAMETER in $* ; do
    echo $PARAMETER
done
