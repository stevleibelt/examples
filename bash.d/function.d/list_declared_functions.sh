#!/bin/bash
####
# ref: https://stackoverflow.com/a/9529981
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-06-02
####

function _main()
{
  echo ":: calling >>declare -f<<"
  echo "   Listing function names and function body"
  declare -f

  echo ":: calling >>declare -F<<"
  echo "   Listing only function names"
  declare -F
}

_main "${@}"

