#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-07
#
# links:
#    * http://www.tldp.org/LDP/abs/html/string-manipulation.html
#    * http://stackoverflow.com/questions/15351423/how-to-get-part-of-the-string-in-bash
#    * https://www.linuxquestions.org/questions/linux-newbie-8/simple-bash-script-help-grabbing-part-of-a-string-316917/
####

function _main () {

STRING="FooBar-1.2.3-baz.tar.gz";
  #Substringing with positions
  #${STRING:<start>:<length>"
  local FIRST_THREE_CHARACTERS=${STRING:0:3};
  local FROM_FOURTH_CHARACTER=${STRING:3};
  local A_PIECE_OF=${STRING:7:5};
  local LAST_CHARACTER=${STRING: -1};
  local WITHOUT_THE_EXTENSION=${STRING:0:-3}

  echo ":: Outputting full string"
  echo "   \${STRING}"
  echo "   ${STRING}"

  echo ":: First three characters"
  echo "   \${STRING:0:3}"
  echo "   ${FIRST_THREE_CHARACTERS}"

  echo ":: From fourth character"
  echo "   \${STRING:3}"
  echo "   ${FROM_FOURTH_CHARACTER}"

  echo ":: A piece of"
  echo "   \${STRING:7:5}"
  echo "${A_PIECE_OF}"

  echo ":: Last charachter"
  echo "   \${STRING: -1}"
  echo "   ${LAST_CHARACTER}"

  echo ":: Without the extension"
  echo "   \${STRING:0:-3}"
  echo "   ${WITHOUT_THE_EXTENSION}"

  echo ":: All after baz."
  echo "   \${STRING#*\"baz\"}"
  echo "   "${STRING#*"baz"}

  echo ":: All until the last >>-<<."
  echo "   \${STRING%-*}"
  echo "   ${STRING%-*}"

  echo ":: All until the first >>-<<."
  echo "   \${STRING%%-*}"
  echo "   ${STRING%%-*}"
}

_main ${@}
