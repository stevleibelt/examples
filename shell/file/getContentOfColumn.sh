#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

if [ $# -ne 2 ]; then
    echo 'Usage: '$0' <file> <linenumber>'
    exit 1
fi

head -$2 $1 | tail -1   # seek to line $2 in file $1 (with head) and output this one column (with tial)
