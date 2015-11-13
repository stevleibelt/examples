#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-11-13
# @thanks
#   https://github.com/alexanderduring
#   https://github.com/dirkwinkhaus
####

if [[ $# -eq 0 ]]; then
    PATH_TO_SEARCH_IN="."
else
    PATH_TO_SEARCH_IN="$1"
fi

find $PATH_TO_SEARCH_IN -type f -exec basename \{\} \; | rev | cut -d'.' -f 1 | rev | sort | uniq
