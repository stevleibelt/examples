#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2025-12-01
####

function _main() {
  local FILE_PATH
  local FILE_PATH_EXTENSION

  if [[ -z "${1}" ]];
  then
    FILE_PATH=$(ls -t | head -n 1)
  else
    FILE_PATH="${1}"
  fi

  FILE_PATH_EXTENSION="${FILE_PATH##*.}"

  echo ":: File path: >>${FILE_PATH}<<"
  echo ":: File extension: >>${FILE_PATH_EXTENSION}<<"
}

_main "${@}"
