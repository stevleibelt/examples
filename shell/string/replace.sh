#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-08.28
# @see
#   http://www.tldp.org/LDP/abs/html/untyped.html
####

string='there is no foo without a bar'

echo $string

string=${string/no foo/never a bar}

echo 'replaced'
echo $string
