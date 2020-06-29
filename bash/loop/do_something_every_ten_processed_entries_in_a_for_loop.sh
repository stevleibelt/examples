#!/bin/bash
####
# Example how to do something every ten iterations in a for loop
####
# @since 2020-03-04
# @author stev leibelt <artodeto@bazzline.net>
####

for ITERATOR in $(seq 0 1 100);
do
    if [[ $(calc ${ITERATOR} % 10) -eq 0 ]];
    then
        echo ${ITERATOR}
    fi
done
