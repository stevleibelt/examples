#!/bin/bash
####
# @author stev leibelt <artodeto@arcor.de>
# @since 20220324
# @see
#   https://www.shellhacks.com/find-out-text-file-line-endings-lf-or-clrf/
###

function _main ()
{
    #bo: variable
    local FILE_PATH="${1}"
    #eo: variable

    #bo: code
    if [[ -f "${FILE_PATH}" ]];
    then
        echo ":: First check, searching for >>CRLF<< line terminators."
        echo ""

        if file "${FILE_PATH}" | grep -q 'CRLF';
        then
            echo ":: File >>${FILE_PATH}<< contains CRLF line terminators."
            echo "   Assuming this is a windows file."
        else
            echo ":: File >>${FILE_PATH}<< does not contain CRLF line terminators."
            echo "   Assuming this is a unix/linux file."
        fi

        echo ":: Second check, searching for >>^M$<< line endings."
        echo ""

        if cat -e "${FILE_PATH}" | grep -q '\^M\$';
        then
            echo ":: File >>${FILE_PATH}<< contains line endings >>^M$<<."
            echo "   Assuming this is a windows file."
        else
            echo ":: File >>${FILE_PATH}<< does not contain line endings >>^M$<<."
            echo "   Assuming this is a unix/linux file."
        fi

    else
        echo ":: Invalid file path provided."
        echo "   >>${FILE_PATH}<< is not a file."

        exit 1
    fi
    #eo: code
}

_main $*
