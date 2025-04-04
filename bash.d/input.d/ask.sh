#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 20220-08-19
####

function _main ()
{
  local DEFAULT
  local ANSWER

  DEFAULT="There is no foo without a bar"

  read -p "> Input something (default: ${DEFAULT}): " -r
  ANSWER="${REPLY:-${DEFAULT}}"

  echo ":: Your answer was."
  echo "   >>${ANSWER}<<."
}

_main "${@}"
