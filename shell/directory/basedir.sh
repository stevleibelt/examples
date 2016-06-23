#!/bin/sh
########
# base directory of script
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2012-11-26
########

## get path of the called script
PATH_OF_THE_CALLED_SCRIPT=$(cd $(dirname "$0"); pwd)

## get path of the current script
PATH_OF_THE_CURRENT_SCRIPT=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)

echo "relative path to the script from your current working directory:"
echo "    $0"
echo "path of the called script:"
echo "    $PATH_OF_THE_CALLED_SCRIPT"
echo "path of the current script:" 
echo "    $PATH_OF_THE_CURRENT_SCRIPT"
exit 0
