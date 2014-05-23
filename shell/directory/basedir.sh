#!/bin/sh
########
# base directory of script
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2012-11-26
########

## get path of the called script
SCRIPT_PATH=$(cd $(dirname "$0"); pwd)

## get path of the current script
SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)

echo "$0 is located in path $SCRIPT_PATH"
exit 0
