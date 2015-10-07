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
WITHOUT_REAL_PATH=$(cd $(dirname "${BASH_SOURCE[0]}"); cd ..; pwd)

echo "current script path: "
echo "    "$CURRENT_SCRIPT_PATH
echo ""

echo "parent path: "
echo "    "$ONE_DIRECTORY_ABOVE
echo ""

echo "parent path without real path: "
echo "    "$WITHOUT_REAL_PATH

exit 0
