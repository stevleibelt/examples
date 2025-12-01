#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-05
####

function _main() {
  echo ":: Please insert a file name"
  read -r FILENAME

  FILE_REALPATH=$(realpath "${FILENAME}");

  echo "   Provided filename: >>${FILENAME}<<"
  echo "   Realpath: >>${FILE_REALPATH}<<"

  if [[ ! -f "${FILE_REALPATH}" ]];
  then
      echo "   File does not exist"
  else
      echo "   File exist"
  fi
}

_main "${@}"
