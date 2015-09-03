#!/bin/bash
####
# how to react on executed commands exitcode
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-09-03
####

ls -halt .
echo 'previous command returned exit code: "'$?'"'

ls -halt /root
echo 'previous command returned exit code: "'$?'"'
