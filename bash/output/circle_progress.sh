#!/bin/bash
####
# You spin me round, round, baby round, round
####
# @since 2015-10-30
# @author stev leibelt <artodeto@bazzline.net>
####

ITERATOR=0;

#store current cursor position
#   this way, the next output is a line below the current position
printf "\0337"

while true
do
    if [ $ITERATOR -eq 0 ]; then
        ((++ITERATOR))
        # print on current position
        printf "\0338[-]"
    elif [ $ITERATOR -eq 1 ]; then
        ((++ITERATOR))
        # print on current position
        printf "\0338[\]"
    elif [ $ITERATOR -eq 2 ]; then
        ((++ITERATOR))
        # print on current position
        printf "\0338[|]"
    else 
        ITERATOR=0
        # print on current position
        printf "\0338[/]"
    fi

    sleep 0.5
done
