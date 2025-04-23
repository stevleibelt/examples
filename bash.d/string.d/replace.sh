#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-08.28
# @see
#   http://www.tldp.org/LDP/abs/html/untyped.html
####

function _main ()
{
  local MY_STRING
  local MY_FILE_NAME

  MY_FILE_NAME="foo bar.flac"
  MY_STRING="There is no foo without a bar"

  echo ":: Dumping initial string content."
  echo "   \$MY_FILE_NAME: ${MY_FILE_NAME}"
  echo "   \$MY_STRING: ${MY_STRING}"
  echo ""

  echo ":: Working on MY_STRING"
  echo "   Replacing first occurrence >>no foo<< with >>never a bar<<."
  MY_STRING=${MY_STRING/no foo/never a bar}

  echo "   Dumping string content."
  echo "   ${MY_STRING}"
  echo ""

  echo "   Replacing >> << with >>_<<."
  echo "   Removing all >>a<<."
  MY_STRING=$( echo ${MY_STRING} | tr ' ' '_' | tr -d 'a' )

  echo "   Dumping string content."
  echo "   ${MY_STRING}"
  echo ""

  echo ":: Working on MY_FILE_NAME"
  echo "   Remove first hit from the right >>.flac<< and add >>.mp3<< as suffix."
  MY_FILE_NAME="${MY_FILE_NAME%.flac}.mp3"

  echo "   Dumping file name content."
  echo "   ${MY_FILE_NAME}"
  echo ""
}

_main "${@}"

