#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

function _sub ()
{
  local ONE
  local RESULT

  ONE=1
  RESULT=$((2 - ONE))

  echo ":: 2 - 1 is >>${RESULT}<<"
}

_sub
