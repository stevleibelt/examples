#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

PID="$0_$$"
echo $PID
TEMPFILE='/tmp/'$PID

echo 'line one' > $TEMPFILE
echo 'line two' >> $TEMPFILE

#redirect input, we can not use 3 since 3 is used shell internal
exec 4<$TEMPFILE
read LINE <&4
echo 'first line: '$LINE
read LINE <&4
echo 'second line: '$LINE

rm $TEMPFILE
