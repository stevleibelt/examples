#!/bin/bash
####
# links:    http://www.folkstalk.com/2012/09/find-length-of-string-in-unix-linux.html
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-17
####

####
# [@param <string: the string you want to validate>
####
function _main ()
{
    local STRING="${1-'There is no foo without a bar'}"
    #hashtag only works with variables
    local LENGTH_WITH_HASHTAG=${#STRING}

    #following are working with real strings also
    local LENGTH_WITH_WORDCOUNT=$(echo $STRING | wc -c)
    local LENGTH_WITH_AWK=$(echo $STRING | awk '{print length}')
    local LENGTH_WITH_EXPR=$(expr length "$STRING")

    echo ":: The string >>${STRING}<< has a length of:"
    echo "  * with hashtag: >>${LENGTH_WITH_HASHTAG}<<"
    echo "  * with wc: >>${LENGTH_WITH_WORDCOUNT}<<"
    echo "  * with awk: >>${LENGTH_WITH_AWK}<<"
    echo "  * with expr: >>${LENGTH_WITH_EXPR}<<"
}

_main $*
