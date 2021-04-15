#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-04-04
# @see
#   https://bash.cyberciti.biz/guide/Howto:_convert_string_to_all_uppercase
#   http://stackoverflow.com/questions/14646022/tr-a-z-a-z-shows-error-in-unix
#   https://blog.victormendonca.com/2017/09/19/bash-parameter-expansion/
####

echo "outputting your arguments"
echo ""

for LOCAL_STRING in "$@"; do
    echo "your argument:  $LOCAL_STRING"
    echo "  to uppercase: "$(echo $LOCAL_STRING | tr a-z A-Z)
    echo "  to lowercase: "$(echo $LOCAL_STRING | tr A-Z a-z)
done

# or

$MY_STRING = "there is no foo without a bar."

echo ":: Original"
echo ${MY_STRING}

echo ":: First character upper case."
echo ${MY_STRING^}

echo ":: All characters upper case."
echo ${MY_STRING^^}

echo ":: First character lower case."
echo ${MY_STRING,}

echo ":: All characters lower case."
echo ${MY_STRING,,}

echo ":: Invert first character case."
echo ${MY_STRING~}

echo ":: Invert all character cases."
echo ${MY_STRING~~}
