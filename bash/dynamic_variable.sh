#!/bin/bash
####
# Example of dynamic variable usage or variable variable
####

function _main ()
{
  local BAR
  local FOO

  BAR="FOO"
  FOO="there is no foo without a bar"

  echo "  ${!BAR}"
}

_main

