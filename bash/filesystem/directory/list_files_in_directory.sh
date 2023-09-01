#!/bin/bash
####
# @since 2018-11-20
# @author stev leibelt <artodeto@bazzline.net>
####

####
# [@param <string: FILE_NAME_SEARCH_PATH>]
# [@param <string: FILE_NAME_SEARCH_PATTERN>]
####
function _main ()
{
    echo ":: Usage"
    echo "   ${0:2} [<string: path=.] [<string: search pattern=*.sh]"
    echo ""

    local FILE_NAME_SEARCH_PATH="${1:-.}"
    local FILE_NAME_SEARCH_PATTERN="${2:-*.sh}"

    if [[ ! -d "${FILE_NAME_SEARCH_PATH}" ]];
    then
        echo ":: Provided path is not a directory,"
        echo "   >>${FILE_NAME_SEARCH_PATH}<< is invalid."

        return 1
    fi

    echo ":: Using find and outputting all file names in one line."
    echo -n "   "

    find ${FILE_NAME_SEARCH_PATH} -iname "${FILE_NAME_SEARCH_PATTERN}" -type f -exec sh -c 'printf " ${0:2}"' {} \;

    echo ""
    echo ""

    echo ":: Using find and outputting each file name on one line."
    echo ""

    find ${FILE_NAME_SEARCH_PATH} -name "${FILE_NAME_SEARCH_PATTERN}" -type f | while read FILE_PATH;
    do
        echo "   ${FILE_PATH:2}";
    done;
}

_main ${@}
