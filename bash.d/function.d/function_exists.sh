#!/bin/bash
####
# ref: https://stackoverflow.com/a/85903
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-06-02
####

function _main()
{
  local FUNCTION_NAME_TO_TEST

  FUNCTION_NAME_TO_TEST="${1:-_main}"

  echo "usage: $(basename ${0}) [<string: function_name_to_test - default is _main]"

  if [[ $(type -t ${FUNCTION_NAME_TO_TEST}) == function ]]
  then
    echo "   Function >>${FUNCTION_NAME_TO_TEST}<< exists."
  else
    echo "   Function >>${FUNCTION_NAME_TO_TEST}<< does not exist."
  fi
}

_main "${@}"

