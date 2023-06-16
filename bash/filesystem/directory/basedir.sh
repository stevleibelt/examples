#!/bin/sh
########
# base directory of script
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2012-11-26
########

## get path of the called script
PATH_OF_THE_CALLED_SCRIPT=$(cd $(dirname "${0}"); pwd)

## get path of the current script
#works only in bash
PATH_OF_THE_CURRENT_SCRIPT_BASH=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)
#works also in sh
PATH_OF_THE_CURRENT_SCRIPT_SH=$(dirname `which ${0}`)

echo ":: Relative path to the script from your current working directory:"
echo "    ${0}"
echo ":: Path of the called script:"
echo "    ${PATH_OF_THE_CALLED_SCRIPT}"
echo ":: Path of the current script with bash power:" 
echo "    ${PATH_OF_THE_CURRENT_SCRIPT_BASH}"
echo ":: Path of the current script with sh power:" 
echo "    ${PATH_OF_THE_CURRENT_SCRIPT_SH}"

