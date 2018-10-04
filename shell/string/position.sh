#!/bin/bash
####
# links: http://www.softpanorama.org/Scripting/Shellorama/Reference/string_operations_in_shell.shtml#Index
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-17
####

STRING="There is no foo without a bar"
SUBSTRING="foo"
echo "String: >>${STRING}<<."

# index of starts with "0"
INDEX_OF_FOO=$(expr index "${STRING}" "${SUBSTRING}")
echo "Index of starts with 0 >>${INDEX_OF_FOO}<<."

# add "+1" to start with position "1"
INDEX_OF_FOO=$((INDEX_OF_FOO+1))
echo "Index plus 1 >>${INDEX_OF_FOO}<<."

echo ">>foo<< is on position: >>${INDEX_OF_FOO}<<."
