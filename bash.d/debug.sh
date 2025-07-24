#!/bin/bash
####
# ref: https://utcc.utoronto.ca/~cks/space/blog/programming/BashGoodSetEReports
####
# @since 2025-07-24
# @author stev leibelt <artodeto@bazzline.net>
####

function _main ()
{
  # Script will immediately stop on any unexpected errors from commands
  set -e

  # Register trap on error
  trap 'echo "Exit status $? at line $LINENO from: $BASH_COMMAND"' ERR

  ls /foo
}

_main
