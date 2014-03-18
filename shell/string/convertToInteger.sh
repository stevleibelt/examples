#!/bin/bash
####
# links: https://www.linuxquestions.org/questions/programming-9/converting-string-to-integer-in-bash-608444/
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-18
####

STRING="13"
INTEGER=29
RESULT=$((STRING+INTEGER))

echo $STRING' + '$INTEGER' = '$RESULT
