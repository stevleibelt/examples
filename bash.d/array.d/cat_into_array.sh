#!/bin/bash
########
# @author stevleibelt
# @since 2016-10-16
########

function _main () {
  declare -a SCRIPT_LINES_AS_ARRAY=( )

  SCRIPT_LINES_AS_ARRAY=( $(cat ${0}) )

  #echo ":: Outputting content of this script line by line"
  #echo ""

  echo ${SCRIPT_LINES_AS_ARRAY}

  for INDEX_KEY in "${!SCRIPT_LINES_AS_ARRAY[@]}";
  do
    echo "line number ${INDEX_KEY}: ${SCRIPT_LINES_AS_ARRAY[${INDEX_KEY}]}"
  done;
}

_main ${@}

