#!/bin/bash
####
# @see:
#   http://www.tldp.org/LDP/abs/html/string-manipulation.html
#   https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
#   http://www.softpanorama.org/Scripting/Shellorama/Reference/string_operations_in_shell.shtml#Index
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-11-15
####

function string_contains ()
{
    #-z "${2##*$1*}"    #"string##substring" deletes longest match of substring from string, "-z " tests if the rest of the string has a zero length/is null
    #-z "$1"            #test if the string/first parameter has a zero length/is null
    #-n "$2"            #test if the string/first parameter has not a zero length/is not null
    [ -z "${2##*$1*}" ] && { [ -z "$1" ] || [ -n "$2" ] ;} ;
}

####
# @param <string: haystack>
# @param <string: needle>
####
function _string_contains ()
{
  if [[ ${1} == *${2}* ]];
  then
    return 0
  else
    return 1
  fi
}

STRING="There is no foo without a bar"
SUBSTRING="foo"
#SUBSTRING="baz"

#if string_contains "${STRING}" "${SUBSTRING}"; #has a bug
#if grep -q ${SUBSTRING} <<<"${STRING}";    #works only on bash
#if grep -q ${SUBSTRING} <(echo ${STRING}); #works pretty well but is really slow

if _string_contains "${STRING}" "${SUBSTRING}";
then
    echo ">>${SUBSTRING}<< is inside >>${STRING}<<."
else
    echo ">>${SUBSTRING}<< is not inside >>${STRING}<<."
fi

if [[ ${STRING} == *iz* ]];
then
    echo ">>iz<< is inside >>${STRING}<<."
else
    echo ">>iz<< is not inside >>${STRING}<<."
fi

