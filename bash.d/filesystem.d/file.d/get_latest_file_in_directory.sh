#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-08-28
# @see
#   http://mywiki.wooledge.org/BashFAQ/003
####

basedir=$(cd $(dirname "$0"); pwd);
unset -v latest
for file in "$basedir"/*; do
    # -nt = newer than
    [[ $file -nt $latest ]] && latest=$file
done

echo 'latest file in:'
echo $basedir
echo 'is:'
echo $latest
