#!/bin/bash
####
# @since 2022-05-23
# @author stev leibelt <artodeto@bazzline.net>
####

####
# @param [<string: "string,with,separator>"free,as,in,freedom,not,as,in,beer"]
# @param [<string: "separator">=","]
####
function _explode ()
{
    local SEPARATOR="${2:-','}"
    local STRING_TO_EXPLODE="${1:-'free,as,in,freedom,not,as,in,beer'}"

    local EXPLODED_STRING=($(echo ${STRING_TO_EXPLODE} | tr "${SEPARATOR}" "\n"))

    echo ":: String to explode >>${STRING_TO_EXPLODE}<<."
    echo ":: Separator >>${SEPARATOR}<<."
    echo ""
    echo ":: Dumping exploded string."
    echo ""

    for CURRENT_STRING in "${EXPLODED_STRING[@]}";
    do
        echo "   >>${CURRENT_STRING}<<."
    done
}

_explode ${@}
