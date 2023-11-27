#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-10-27
# @see
####

echo "executing \"ls -halt /tmp\""
RESULT=$(ls -halt /tmp)

echo "last exist code was ${?}"

echo "executing \"ls -halt /root\""
RESULT=$(ls -halt /root)

echo "last exist code was ${?}"
