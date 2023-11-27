#!/bin/bash
########
# Convert multiple line content of a file to a single line
# ref: https://unix.stackexchange.com/questions/593993/convert-multi-lines-to-single-line-with-spaces-and-quotes
#
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-06.09
########

function _main()
{
  local PATH_OF_THE_CALLED_SCRIPT
  local PATH_TO_TEST_FILE

  PATH_OF_THE_CALLED_SCRIPT=$(cd $(dirname "${0}"); pwd)

  PATH_TO_TEST_FILE="${PATH_OF_THE_CALLED_SCRIPT}/test.txt"

  if [[ ! -f "${PATH_TO_TEST_FILE}" ]];
  then
    echo ":: Expected file >>${PATH_TO_TEST_FILE}<< does not exist."

    return 1
  fi

  echo ":: tr"
  tr '\n' ';' < "${PATH_TO_TEST_FILE}"
  echo ""

  echo ":: tr and sed"
  tr '\n' ';' < "${PATH_TO_TEST_FILE}" | sed 's/;$/"\n/; s/^/"/; s/;/" "/g'
  echo ""

  echo ":: awk"
  awk '{printf "%s\"%s\"", sep, $0; sep=OFS} END{print ""}' "${PATH_TO_TEST_FILE}"
  echo ""

  echo ":: sed"
  # first, double quotes are added around each line
  # second, lines are joind togehter
  sed 's/^/"/;s/$/"/' "${PATH_TO_TEST_FILE}" | sed ':a;{N;s/\n/ /;ba}'
  echo ""
}

_main "${@}"

