#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2026-01-09
####

function _main ()
{
  local HASH
  local PASSWORD

  # -r  : Do not handle backslash as special character
  # -p  : Provide a prompt string in front of the user input
  # -S  : Silents the command to prevent printing the user input
  read -r -s -p "> Insert password: " PASSWORD
  echo ""

  # echo -n             : Prevent new line to prevent distorting of the password
  # sha256sum -         : Change standard input to no file
  # awk '{ print $1 }'  : Slice out the calculated hash only
  HASH=$(echo -n "${PASSWORD}" | sha256sum --binary | awk '{ print $1 }')

  echo ":: Printing th sha256sum of your password."
  echo "   ${HASH}"
}

_main "${@}"
