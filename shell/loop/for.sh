#!/bin/bash
####
# @see
#   https://ma.ttias.be/bash-loop-first-step-automation-linux/
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-07-07
####

#begin of simple loop from 3 to 1
echo ""
echo "a simple loop, counting down from 3 to 1"

for ITERATOR in 1 2 3
do
    echo $ITERATOR
done

echo ""
#end of simple loop from 3 to 1

#begin of dynamic values
echo ""
echo "now we are using a dynamic list of values by using ls"

for FILESYSTEM_ITEM_NAME in $(ls)
do
    echo "current filesystem item name: $FILESYSTEM_ITEM_NAME"
done

echo ""
echo "using seq (2 3 22) as number generator"

for ITERATOR in $(seq 2 3 22)
do
    echo $ITERATOR
done

echo ""
#end of dynamic values
