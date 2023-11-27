#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-26
########

function _main ()
{
  local DATE="06/10/1983"
  local TIMESTAMP=424044000

  local DATE_FROM_TIMESTAMP=$(date -d @${TIMESTAMP} +'%Y-%m-%d %H:%M:%S')
  local TIMESTAMP_FROM_DATE=$(date -d ${DATE} +'%s')

  echo ":: From timestamp to date"
  echo "   date -d @'${TIMESTAMP}' +'%Y-%m-%d %H:%M:%S'"
  echo "   >>${DATE_FROM_TIMESTAMP}<<"
  echo ""

  echo ":: From date to timestamp"
  echo "   date -d '${DATE}' +'%s'"
  echo "   >>${TIMESTAMP_FROM_DATE}<<"
  echo ""
}

_main ${@}

