#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2026-05-19
####

function _calculate_time_elapsed()
{
  local CURRENT_TIME
  local FILE_CTIME
  local SECONDS_ELAPSED
  local STAT_CTIME

  STAT_CTIME=$(stat -c %W "${1}" 2>/dev/null)

  if [[ ! -f "${1}" ]];
  then
    echo "ERROR: No file found, file path=${1}"

    exit 1
  fi

  if [[ -z "${STAT_CTIME}" ]];
  then
    echo "ERROR: Could not retrieve stat -c, file path=${1}"

    exit 2
  fi

  FILE_CTIME=$(echo "${STAT_CTIME}" | awk '{print int($1)}')

  CURRENT_TIME=$(date +%s)

  SECONDS_ELAPSED=$(( CURRENT_TIME - FILE_CTIME ))

  #echo "   STAT_CTIME: ${STAT_CTIME}"
  #echo "   FILE_CTIME: ${FILE_CTIME}"
  #echo "   CURRENT_TIME: ${CURRENT_TIME}"
  #echo "   SECONDS_ELAPSED: ${SECONDS_ELAPSED}"

  echo ${SECONDS_ELAPSED}
}

function _main()
{
  local FILE_PATH
  local SECONDS_ELAPSED

  FILE_PATH=$(mktemp)

  echo "Created file: ${FILE_PATH}"

  SECONDS_ELAPSED=$(_calculate_time_elapsed "${FILE_PATH}")
  echo "   Seconds elapsed: ${SECONDS_ELAPSED}"
  echo "Sleeping for 10 seconds"
  sleep 10

  SECONDS_ELAPSED=$(_calculate_time_elapsed "${FILE_PATH}")
  echo "   Seconds elapsed: ${SECONDS_ELAPSED}"
  echo "Sleeping for 12 seconds"
  sleep 12

  SECONDS_ELAPSED=$(_calculate_time_elapsed "${FILE_PATH}")
  echo "   Seconds elapsed: ${SECONDS_ELAPSED}"
  echo "Sleeping for 15 seconds"
  sleep 15

  SECONDS_ELAPSED=$(_calculate_time_elapsed "${FILE_PATH}")
  echo "   Seconds elapsed: ${SECONDS_ELAPSED}"

  rm "${FILE_PATH}"
  echo "Removed file: ${FILE_PATH}"
}

_main "${@}"
