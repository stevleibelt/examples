#!/bin/bash
####
# Calculates the permitted minimum and maxium based on the given value
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2024-10-16
####

####
# [<int: number>] [<int: tolerance]
####
function _main() {
  local BASE_VALUE
  local CALCULATED_MAXIUM
  local CALCULATED_MINIMUM
  local CALCULATED_TOLERANCE
  local TOLERANCE

  BASE_VALUE="${1:-750}"
  TOLERANCE="${2:-10}"

  # check if bc is available
  if command -v bc &> /dev/null;
  then
    # scale=0; ... / 1 results in an integer value than a float
    CALCULATED_TOLERANCE=$(echo "scale=0; ${BASE_VALUE} * 0.${TOLERANCE} / 1" | bc)

    CALCULATED_MAXIUM=$(echo "${BASE_VALUE} + ${CALCULATED_TOLERANCE}" | bc)
    CALCULATED_MINIMUM=$(echo "${BASE_VALUE} - ${CALCULATED_TOLERANCE}" | bc)
  else
    CALCULATED_TOLERANCE=$((${BASE_VALUE} * ${TOLERANCE} / 100))

    CALCULATED_MAXIUM=$((${BASE_VALUE} + ${CALCULATED_TOLERANCE}))
    CALCULATED_MINIMUM=$((${BASE_VALUE} - ${CALCULATED_TOLERANCE}))

    #remove float part
    CALCULATED_MAXIUM=${CALCULATED_MAXIUM%.*}
    CALCULATED_MINIMUM=${CALCULATED_MINIMUM%.*}
  fi

  echo ":: Based on the number: ${BASE_VALUE} and the tolerance: ${TOLERANCE}"
  echo "   Calculated tolerance: ${CALCULATED_TOLERANCE}"
  echo "   Calculated maximum would be: ${CALCULATED_MAXIUM}"
  echo "   Calculated minium would be: ${CALCULATED_MINIMUM}"
}

_main "${@}"
