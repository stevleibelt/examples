#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

RESULT=$((1 + 1))
echo '1 + 1 is: '$RESULT

echo ""
VAR=3
echo "VAR: ${VAR}"

VAR=$((VAR + 1))
echo "VAR + 1: ${VAR}"

VAR=$((++VAR))
echo "++VAR: ${VAR}"

VAR=$((VAR++))
echo "VAR++: ${VAR}"
