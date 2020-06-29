#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2013-02-02
########

#as example, current date time is
#   year: 1983
#   month: 10
#   day: 06
#   hour: 13
#   minute: 37
#   second: 00

#10/06/83
echo "date +'%D'"
date +'%D'
echo ""

#13:37:00
echo "date +'%T'"
date +'%T'
echo ""

#13+37
echo "date +'%H-%M'"
date +'%H+%M'
echo ""

#83-10-06
echo "date +'%y-%m-%d'"
DATE=$(date +'%y-%m-%d')
echo ${DATE}
echo ""

#1983-10-06 13:37:00
echo "date +'%Y-%m-%d %H:%M:%S'"
DATE=$(date +'%Y-%m-%d %H:%M:%S')
echo ${DATE}
echo ""

#19831006.133700
echo "date +'%Y%m%d.%H%M%S'"
DATE=$(date +'%Y%m%d.%H%M%S')
echo ${DATE}
echo ""
