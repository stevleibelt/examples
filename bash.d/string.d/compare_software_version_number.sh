#!/bin/bash
####
# @since 2025-04-19
# @author stev leibelt <artodeto@bazzline.net>
####

function _main()
{
  local FIRST_BUGFIX
  local FIRST_MAJOR
  local FIRST_MINOR
  local FIRST_VERSION
  local SECOND_BUGFIX
  local SECOND_MAJOR
  local SECOND_MINOR
  local SECOND_VERSION

  FIRST_VERSION="${1:-1.2.3}"
  SECOND_VERSION="${2:-2.3.4}"

  # split version by using >>.<< as delimiter
  IFS='.' read -r FIRST_MAJOR FIRST_MINOR FIRST_BUGFIX <<< "${FIRST_VERSION}"
  IFS='.' read -r SECOND_MAJOR SECOND_MINOR SECOND_BUGFIX <<< "${SECOND_VERSION}"

  echo ":: Comparing ${FIRST_VERSION} with ${SECOND_VERSION}"

  # compare major
  if (( FIRST_MAJOR < SECOND_MAJOR ));
  then
    echo "${SECOND_VERSION} is greater ${FIRST_VERSION}"
  else
    # compare minor
    if (( FIRST_MINOR < SECOND_MINOR ));
    then
      echo "${SECOND_VERSION} is greater ${FIRST_VERSION}"
    else
      # compare bugfix
      if (( FIRST_BUGFIX < SECOND_BUGFIX ));
      then
        echo "${SECOND_VERSION} is greater ${FIRST_VERSION}"
      fi
    fi
  fi
}

_main "${@}"
