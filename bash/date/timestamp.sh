#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-26
########

echo ":: From timestamp to date"
TIMESTAMP=424044000
echo "date -d @'${TIMESTAMP}' +'%Y-%m-%d %H:%M:%S'"
echo $(date -d @${TIMESTAMP} +'%Y-%m-%d %H:%M:%S')
echo ""

echo ":: From date to timestamp"
DATE='06/10/1983'
echo "date -d '${DATE}' +'%s'"
echo $(date -d ${DATE} +'%s')
echo ""
