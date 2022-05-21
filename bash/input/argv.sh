#!/bin/bash
####
# @since 2022-05-21
# @author stev leibelt <artodeto.bazzline.net>
####

function _main ()
{
  echo ":: You've provided following arguments."
  echo "   ${@}"

  echo ""

  while (( ${#} ))
  do 
      echo "   >>${1}<<"
      shift 1
  done
}

_main "${@}"
