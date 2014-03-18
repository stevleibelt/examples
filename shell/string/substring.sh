#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-17
####

STRING="There is no foo without a bar"
# ${<string>:<position>[:<length>]}
SUBSTRING=${STRING:12:3}${STRING:26}

echo $STRING
echo $SUBSTRING
