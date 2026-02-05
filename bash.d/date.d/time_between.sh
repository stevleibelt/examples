#!/bin/bash
########
# @ref: https://blog.miguelgrinberg.com/post/date-arithmetic-in-bash
# @author stev leibelt <artodeto@bazzline.net>
# @since 2026-02-05
########

function _main()
{
  local END_DATETIME_STRING
  local START_DATETIME_STRING

  END_DATETIME_STRING=${2:-'2016-04-17T08:00:00Z'}
  START_DATETIME_STRING=${1:-'1983-10-06T23:42:13Z'}

  # Convert datetime from string to unix timestamp
  START_SECS=$(date -d "${START_DATETIME_STRING}" +%s)
  END_SECS=$(date -d "${END_DATETIME_STRING}" +%s)

  # Calculate the difference between the unix timestamps
  DIFF_SECS=$((END_SECS - START_SECS))

  echo ":: Debug"
  echo "START_DATETIME_STRING: ${START_DATETIME_STRING}"
  echo "END_DATETIME_STRING: ${END_DATETIME_STRING}"
  echo "START_SECS: ${START_SECS}"
  echo "END_SECS: ${END_SECS}"
  echo "DIFF_SECS: ${DIFF_SECS}"

  # Calculate the rest of seconds left
  SECS=$((DIFF_SECS % 60))
  # Calculate the rest of minutes left
  MINS=$((DIFF_SECS / 60 % 60))
  # Calculate the rest of hours left
  HOURS=$((DIFF_SECS / 3600 % 24))
  # Calculate the days
  DAYS=$((DIFF_SECS / 86400))

  echo ""
  echo ":: Result"
  echo "The time between the two given datetimes is: DAYS: ${DAYS}, HOURS: ${HOURS}, MINUTES: ${MINS}, SECONDS: ${SECS}"
}

_main "${@}"
