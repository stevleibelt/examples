#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-11-05
# @see http://www.cyberciti.biz/tips/howto-linux-unix-find-move-all-mp3-file.html
####

if [[ $# -eq 3 ]];
then
    SEARCH_PATTERN="${1}"
    #yes, this could be optional
    DESTIONATION_PATH="${2}"
    #yes, this could be optional
    MAXIUM_DIRECTORY_DEPTH_TO_SEARCH_FOR="${3}"
else
    echo ":: Invalid number of arguments provided."
    echo ":: Usage"
    echo "   ${BASE_NAME} <search pattern> <destination path> <maximum dirctory depth to search for>"

    exit 1
fi

#find and move
find . -maxdepth ${MAXIUM_DIRECTORY_DEPTH_TO_SEARCH_FOR} -iname "${SEARCH_PATTERN}" -type f -print0 | xargs -0 -I {} mv "{}" "${DESTIONATION_PATH}"

#delete empty directories
find . -maxdepth ${MAXIUM_DIRECTORY_DEPTH_TO_SEARCH_FOR} -type d -empty -delete
