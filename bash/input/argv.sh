#!/bin/bash
####
# @since 2022-05-21
# @author stev leibelt <artodeto.bazzline.net>
####

function _main ()
{
  if [[ ${#} -gt 0 ]];
  then
    echo ":: You've provided following arguments."
    echo "   ${@}"

    echo ""

    while (( ${#} ))
    do 
        echo "   >>${1}<<"
        shift 1
    done
  else
    echo ":: No arguments provided"
    echo "Usage: $(basename ${0}) argument1 [argument2...]"
  fi
}

_main "${@}"
