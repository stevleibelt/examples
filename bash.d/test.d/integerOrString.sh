#!/bin/sh
########
# @author stevleibelt <artodeto@bazzline.net>
# @since 2014-08-28
# @see
#   http://www.tldp.org/LDP/abs/html/untyped.html
########

integer=123456789
echo "integer: "$integer
let "integer += 1"
echo "increased by one: "$integer

# transforming into a string
string=${integer/45/FourFive}
echo "string: "$string

#declear it as integer
declare -i string
echo "string: "$string

integer=${string/FourFive/45}
let "integer -= 1"
echo "integer: "$integer
