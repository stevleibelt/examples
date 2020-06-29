#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-10-30
####

ITERATOR=0;

# store current cursor position
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
