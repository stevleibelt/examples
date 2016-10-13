#!/bin/sh
########
# Example for using date.
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2013-02-02
########

echo "date +'%D'"
date +'%D'
echo ""

echo "date +'%T'"
date +'%T'
echo ""

echo "date +'%H-%M'"
date +'%H+%M'
echo ""

echo "date +'%y-%m-%d'"
DATE=$(date +'%y-%m-%d')
echo ${DATE}
echo ""

echo "date +'%Y-%m-%d %H:%M:%S'"
DATE=$(date +'%Y-%m-%d %H:%M:%S')
echo ${DATE}
echo ""
