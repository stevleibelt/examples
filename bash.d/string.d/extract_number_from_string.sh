#!/bin/bash
####
# @see
#   https://linuxconfig.org/how-to-extract-number-from-a-string-using-bash-example
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-01-30
####

function _main ()
{
  local STRING="${1:-'There is no 42 foo without an 13 bar.'}"

  echo ":: Dumping the source string."
  echo "   >>${STRING}<<"
  echo ""

  echo ":: Bash only >>\${STRING//[!0-9]/}"
  echo ${STRING//[!0-9]/}
  echo ""

  echo ":: Bash only >>\${STRING//[^0-9]/}"
  echo ${STRING//[^0-9]/}
  echo ""

  if [[ -f /usr/bin/awk ]];
  then
    echo ":: Using >>awk -F'[^0-9]*' '$0=$2'<<"
    echo "${STRING}" | awk -F'[^0-9]*' '$0=$2'
    echo ""
  fi

  if [[ -f /usr/bin/grep ]];
  then
    echo ":: Using >>grep -o -E '[0-9]+'<<"
    echo "${STRING}" | grep -o -E '[0-9]+'
    echo ""
  fi

  if [[ -f /usr/bin/sed ]];
  then
    echo ":: Using >>sed 's/[^0-9]*//g'<<"
    echo "${STRING}" | sed 's/[^0-9]*//g'
    echo ""
  fi

  if [[ -f /usr/bin/tr ]];
  then
    echo ":: Using >>tr -dc '0-9'<<"
    echo "${STRING}" | tr -dc '0-9'
    echo ""
  fi

  if [[ -f /usr/bin/tr ]] && [[ -f /usr/bin/sed ]];
  then
    echo ":: Using >>tr '\n' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'<<"
    echo "   This is the only way where each number will be separeted by a new line."
    echo "${STRING}" | tr '\n' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
    echo ""
  fi

}

_main ${@}
