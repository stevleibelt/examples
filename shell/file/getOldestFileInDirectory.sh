#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-08-28
# @see
#   http://mywiki.wooledge.org/BashFAQ/003
####

basedir=$(cd $(dirname "$0"); pwd);
unset -v olderst
for file in "$basedir"/*; do
    # -ot = older than
    [[ -z $oldest || $file -ot $oldest ]] && oldest=$file
done

echo 'oldest file in:'
echo $basedir
echo 'is:'
echo $oldest
