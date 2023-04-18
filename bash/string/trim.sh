#!/bin/bash
####
# Demonstrate different versions of implementing trim
#
# @see
#   https://unix.stackexchange.com/a/660011
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-04-18
####

function trim ()
{
  ltrim | rtrim
}

function ltrim ()
{
  sed -E 's/^[[:space:]]+//'
}

function rtrim ()
{
  sed -E 's/[[:space:]]+$//'
}

function _main ()
{
  local STRING_TO_TRIM

  STRING_TO_TRIM="${1:- string to trim }"

  echo ":: Original string"
  echo "   >>${STRING_TO_TRIM}<<"
  echo ""

  if [[ -f /usr/bin/awk ]];
  then
    echo ":: Using awk"
    #awk '{$1=$1};1' is the same as awk '{$1=$1;print}'
    echo -e "${STRING_TO_TRIM}" | awk '{$1=$1};1'
    echo ""
  fi

  if [[ -f /usr/bin/sed ]];
  then
    echo ":: Using sed"
    echo -e "${STRING_TO_TRIM}" | sed 's/^[ \t]*//;s/[ \t]*$//'
    echo ""
  fi

  if [[ -f /usr/bin/xargs ]];
  then
    echo ":: Using xargs"
    echo -e "${STRING_TO_TRIM}" | xargs
    echo ""
  fi

  echo ":: Using self written trim"
  echo "${STRING_TO_TRIM}" | trim
  echo ""
}

_main "${@}"

