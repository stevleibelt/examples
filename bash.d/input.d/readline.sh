#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-05
####

function _main ()
{
  echo ":: Enter something."
  read VALUE

  echo ":: You have entered the following value."
  echo "   >>${VALUE}<<"
  echo ""

  echo ":: Please enter a path. Path completion is enabled."
  read -e INPUT_PATH

  echo ":: You have entered the following value."
  echo "   >>${INPUT_PATH}<<"
  if [[ -f "${INPUT_PATH}" ]];
  then
    echo "   Input path is a file!"
  elif [[ -d "${INPUT_PATH}" ]];
  then
    echo "   Input path is a directory!"
  else
    echo "   Input path is not a file or directory or does exist!"
  fi
  echo ""

  DEFAULT_SOMETHING="Rainbow to the stars"
  # needs bash >= 4
  # ref: https://stackoverflow.com/a/2642782
  read -e -i  "${DEFAULT_SOMETHING}" -p ":: Please enter something optional: " SOMETHING
  SOMETHING="${SOMETHING:-$DEFAULT_SOMETHING}"
  echo "   >>${SOMETHING}<<"
  echo ""
}

_main
