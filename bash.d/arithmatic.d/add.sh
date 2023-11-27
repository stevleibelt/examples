#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

RESULT=`expr 1 + 1`
VAR=3

VAR=$((VAR+1))
((VAR=VAR+1))
((VAR+=1))
((VAR++))

let "VAR=VAR+1"
let "VAR+=1"
let "VAR++"

echo '1 + 1 is: '$RESULT
echo "\$VAR >>${VAR}<<."
