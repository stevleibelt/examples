#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-04-20
####

function _main ()
{
  local USER_INPUT_SEARCH
  local USER_INPUT_SENTENCE

  USER_INPUT_SEARCH="${2:-face}"
  USER_INPUT_SENTENCE="${1:-Do you like base? in your motherfucking face!}"

  if echo "${USER_INPUT_SENTENCE}" | grep -q "${USER_INPUT_SEARCH}";
  then
    echo ">>${USER_INPUT_SEARCH}<< was found in >>${USER_INPUT_SENTENCE}<<"
  fi

  if ! echo "${USER_INPUT_SENTENCE}" | grep -q "${USER_INPUT_SEARCH}";
  then
    echo ">>${USER_INPUT_SEARCH}<< was not found in >>${USER_INPUT_SENTENCE}<<"
  fi
}

_main "${@}"

