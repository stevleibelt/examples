#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-09-03
####

ITERATOR=1
LIMIT=10

while [ $ITERATOR -le $LIMIT ]
do
    echo $ITERATOR' run'
    ((++ITERATOR))
    sleep 1s
done
