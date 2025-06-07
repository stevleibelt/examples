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

function _ask_with_question_and_positiv_answer ()
{
  echo "_ask_with_question_and_positiv_answer"
  local POSITIV_ANSWER
  local QUESTION
  local QUESTION_SUFFIX

  POSITIV_ANSWER="${2:-y}"
  QUESTION="${1}"
  
  if [[ ${POSITIV_ANSWER} == "y" ]];
  then
    QUESTION_SUFFIX=" (Y|n)"
  else
    QUESTION_SUFFIX=" (y|N)"
  fi

  read -p "> ${QUESTION} ${QUESTION_SUFFIX}: " -r

  if [[ ${POSITIV_ANSWER} == "y" ]];
  then
    if [[ ${REPLY:-${POSITIV_ANSWER}} =~ ^[Yy](es)?$ ]];
    then
      return 0
    else
      return 1
    fi
  else
    if [[ ${REPLY:-${POSITIV_ANSWER}} =~ ^[Nn](o)?$ ]];
    then
      return 0
    else
      return 1
    fi
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
  if _ask_with_question_and_positiv_answer "Do you say yes?";
  then
    echo "   positiv"
  else
    echo "   negative"
  fi

  if _ask_with_question_and_positiv_answer "Do you say no?" "n";
  then
    echo "   positiv"
  else
    echo "   negative"
  fi
}

_main "${@}"

