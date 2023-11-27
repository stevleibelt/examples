#!/bin/bash
####
# simple example how to ask yes or now questions in a bash environment
#
# @see
#   http://www.shellhacks.com/en/Yes-No-in-Bash-Script-Prompt-for-Confirmation
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-07-01
####

function _ask_with_if ()
{
  echo ":: _ask_with_if"
  if echo "${1:-n}" | grep -iq '^y$';
  then
    echo "   Yes"
  else
    echo "   No"
  fi
}

function _ask_with_case ()
{
  echo ":: _ask_with_case"
  while true; do
    case ${1} in
      [Yy]* ) 
        echo "   Yes"
        break;;
      [Nn]* )
        echo "   No"
        break;;
      * )
        echo "   Non of the following chars entered: n, N, y or Y."
        break;;
    esac
  done
}

function _ask_with_case_and_default_no ()
{
  echo ":: _ask_with_case_and_default_no"
  while true; do
    case ${1:-n} in #this results in n as default
      [Yy]* ) 
        echo "   Yes"
        break;;
      [Nn]* )
        echo "   No"
        break;;
      * )
        echo "   Non of the following chars entered: n, N, y or Y."
        break;;
    esac
  done
}

function _ask_with_input ()
{
  echo ":: _ask_with_input"
  read -p "> Once again, {y|Y} or {n|N}? " -r

  if [[ ${REPLY} =~ ^[Yy]$  ]];
  then
    echo "   Yes"
  elif [[ ${REPLY} =~ ^[Nn]$  ]];
  then
    echo "   No"
  else
    echo "   Non of the following chars entered: n, N, y or Y."
  fi
}

function _ask_with_input_and_default_no ()
{
  echo ":: _ask_with_input_and_default_no"
  read -p "> Once again, {y|Y} or {n|N} (default: nN)? " -r

  if [[ ${REPLY} =~ ^[Yy]$  ]];
  then
    echo "   Yes"
  else
    echo "   No"
  fi
}

function _main ()
{
  echo "Usage: $(basename ${0}) [<char: [nNyY]>]"
  echo ""

  _ask_with_if "${1}"
  _ask_with_case "${1}"
  _ask_with_case_and_default_no "${1}"
  _ask_with_input
  _ask_with_input_and_default_no
}

_main "${@}"

