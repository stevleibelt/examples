#!/bin/bash
####
# @author stev leibelt <artodeto@arcor.de>
# @since 2016-09-03
# @see
#   http://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable#10929955
###

function _main()
{
  local CURRENT_LINE_CONTENT
  local CURRENT_LINE_NUMBER
  local FILENAME

  FILENAME=$(basename $0)

  CURRENT_LINE_NUMBER=0
  echo -e "line\t: line"
  echo -e "number\t: content"
  echo "--------:--------"

  while IFS='' read -r CURRENT_LINE_CONTENT || [[ -n "${CURRENT_LINE_CONTENT}" ]];
  do
    # filter out empty lines and lines starting with #
    # if [[ "${#CURRENT_LINE_CONTENT}" -gt 0 ]] && [[ "${CURRENT_LINE_CONTENT:0:1}" != "#" ]];
    echo -e "${CURRENT_LINE_NUMBER}\t: ${CURRENT_LINE_CONTENT}"
    ((++CURRENT_LINE_NUMBER))
  done < "${FILENAME}"

  #available with bash 4
  readarray -t FILE_CONTENT_AS_ARRAY < "${FILENAME}"
}

_main "${@}"
