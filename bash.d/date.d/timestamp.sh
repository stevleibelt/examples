#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-26
########

function _main ()
{
  local DATE
  local DATETIME
  local TIMESTAMP
  local DATE_FROM_TIMESTAMP
  local TIMESTAMP_FROM_DATE
  local TIMESTAMP_FROM_DATETIME

  DATE="06/10/1983"
  DATETIME="1983-10-06 08:15:42"
  TIMESTAMP=424044000

  DATE_FROM_TIMESTAMP=$(date -d @${TIMESTAMP} +'%Y-%m-%d %H:%M:%S')
  TIMESTAMP_FROM_DATE=$(date -d ${DATE} +'%s')
  TIMESTAMP_FROM_DATETIME=$(date -d "${DATETIME}" +'%s')

  echo ":: From timestamp to date"
  echo "   date -d @'${TIMESTAMP}' +'%Y-%m-%d %H:%M:%S'"
  echo "   >>${DATE_FROM_TIMESTAMP}<<"
  echo ""

  echo ":: From date to timestamp"
  echo "   date -d '${DATE}' +'%s'"
  echo "   >>${TIMESTAMP_FROM_DATE}<<"
  echo ""

  echo ":: From date time to timestamp"
  echo "   date -d '${DATETIME}' +'%s'"
  echo "   Should be 434272542"
  echo "   >>${TIMESTAMP_FROM_DATETIME}<<"
  echo ""
}

_main "${@}"

