#!/bin/sh
########
# @author stevleibelt <artodeto@bazzline.net>
# @since 2016-01-26
# @see http://superuser.com/a/352290
########

DIR_SELF=$(cd $(dirname "$0"); pwd)

if [ "$(ls -A $DIR_SELF)" ]; then
  echo "'$DIR_SELF' is not emtpy";
else
  echo "'$DIR_SELF' is emtpy";
fi
