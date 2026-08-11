#!/bin/sh
########
# base directory of script
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-10-24
########

function _main ()
{
  local BASE_NAME

  BASE_NAME=$(basename ${0})

  echo ":: Outputting the base name of this script."
  echo "${BASE_NAME}"
}

_main "${@}"
