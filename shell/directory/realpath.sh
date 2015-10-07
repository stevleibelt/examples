#!/bin/sh
########
# base directory of script
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-07
########

## get path of the current script
CURRENT_SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)
ONE_DIRECTORY_ABOVE=$(realpath $CURRENT_SCRIPT_PATH/../)

echo "current script path: "$CURRENT_SCRIPT_PATH
echo "parent path: "$ONE_DIRECTORY_ABOVE

exit 0
