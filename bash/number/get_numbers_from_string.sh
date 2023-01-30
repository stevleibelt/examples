#!/bin/bash
####
# Example how to get numbers from string
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2013-07-08
####

function _main ()
{
  local STRING="What a wunderfull string this is, more the 0 words, over more the 10 characters, nice"

  local NUMBERS=$(echo ${STRING} | tr -cd [:digit:])

  echo ":: Dumping source string."
  echo "   >>${STRING}<<."
  echo ":: Dumping extracted numbers."
  echo "   >>${NUMBERS}<<."
  echo ""
  echo "Also have a look to >>../string/extract_number_from_string.sh<< which contains way more examples."
  echo ""
}

_main ${@}
