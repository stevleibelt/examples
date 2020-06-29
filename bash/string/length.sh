#!/bin/bash
####
# links:    http://www.folkstalk.com/2012/09/find-length-of-string-in-unix-linux.html
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-17
####

STRING="There is no foo without a bar"
#hashtag only works with variables
LENGTH_WITH_HASHTAG=${#STRING}

#following are working with real strings also
LENGTH_WITH_WORDCOUNT=$(echo $STRING | wc -c)
LENGTH_WITH_AWK=$(echo $STRING | awk '{print length}')
LENGTH_WITH_EXPR=$(expr length "$STRING")

echo "${STRING} has a length of:"
echo "  * with hashtag: ${LENGTH_WITH_HASHTAG}"
echo "  * with wc: ${LENGTH_WITH_WORDCOUNT}"
echo "  * with awk: ${LENGTH_WITH_AWK}"
echo "  * with expr: ${LENGTH_WITH_EXPR}"
