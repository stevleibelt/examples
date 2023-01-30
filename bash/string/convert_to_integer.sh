#!/bin/bash
####
# links: https://www.linuxquestions.org/questions/programming-9/converting-string-to-integer-in-bash-608444/
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-18
####

function _main ()
{
  local STRING="13"
  local INTEGER=29

  local RESULT=$((STRING+INTEGER))

  echo "<string: ${STRING}> + <int: ${INTEGER}> = >>${RESULT}<<"
}

_main ${@}
