#!/bin/sh
########
# @author: stevleibelt
# @since: 2024-02-01
########

function _main()
{
  local COMMAND_TO_CHECK

  COMMAND_TO_CHECK="${1:-bash}"

  echo ":: Checking for command: ${COMMAND_TO_CHECK}"

  if command -v "${COMMAND_TO_CHECK}" &> /dev/null;
  then
    echo "   Is available on the system."
  else
    echo "   Is not available on the system."
  fi
}

_main "${@}"
