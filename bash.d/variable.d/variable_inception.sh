#!/bin/bash
########
# @since 2025-03-05
# @author stevleibelt <artodeto@bazzline.net>
########

function _check_variable_is_defined ()
{
  if [[ -n "${!1}" ]];
  then
    echo "   ${1} is defined with content: ${!1}"
  else 
    echo "   ${1} is not defined";
  fi
}

function _main ()
{
  local FOO

  FOO="There is no foo without a bar"

  echo ":: BAR contains the reference to FOO which is defined"
  _check_variable_is_defined "FOO"
  echo ""

  echo ":: BAR contains the reference to BAZ which is not defined"
  _check_variable_is_defined "BAZ"
}

_main
