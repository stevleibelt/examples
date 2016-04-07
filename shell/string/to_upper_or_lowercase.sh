#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-04-04
# @see
#   https://bash.cyberciti.biz/guide/Howto:_convert_string_to_all_uppercase
#   http://stackoverflow.com/questions/14646022/tr-a-z-a-z-shows-error-in-unix
####

echo "outputting your arguments"
    echo ""

for LOCAL_STRING in "$@"; do
    echo "your argument:  $LOCAL_STRING"
    echo "  to uppercase: "$(echo $LOCAL_STRING | tr a-z A-Z)
    echo "  to lowercase: "$(echo $LOCAL_STRING | tr A-Z a-z)
done
