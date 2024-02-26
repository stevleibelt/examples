#!/bin/bash
########
# Creates 10 files
# Deletes all except latest three
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2024-02-26
########

function _main()
{
  echo ":: Setup example"
  PATH_TO_DIRECTORY=$(mktemp)
  touch "${PATH_TO_DIRECTORY}"/test{1..9}.txt

  echo ":: Listing all files"
  ls -t "${PATH_TO_DIRECTORY}"/test*.txt

  echo ":: Deleting all files except latest three"
  # find can handle non-alphanumeric filenames
  # ref: https://www.shellcheck.net/wiki/SC2012
  ls -t "${PATH_TO_DIRECTORY}"/test*.txt | tail -n +4 | xargs rm

  echo ":: Listing available files"
  ls -t "${PATH_TO_DIRECTORY}"/test*.txt

  read -p "> Keep examples? (y|N) " -r

  if [[ ${REPLY} =~ ^[Yy]$ ]];
  then
    echo "   You find the examples in path >>${PATH_TO_DIRECTORY}<<."
  else
    rm -fr "${PATH_TO_DIRECTORY}"
  fi
}

_main "${@}"

