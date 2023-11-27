#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

STRING='There is no foo without a bar'

echo '%s'
printf '%s' $STRING
echo -e '\n'

echo '%40s'
printf '%4s' $STRING
echo -e '\n'

echo '%.4s'
printf '%.4s' $STRING
echo -e '\n'

echo '%10s'
printf '%10s' $STRING
echo -e '\n'

echo '%-10s'
printf '%-10s' $STRING
echo -e '\n'

echo '%10.4s'
printf '%10.4s' $STRING
echo -e '\n'

