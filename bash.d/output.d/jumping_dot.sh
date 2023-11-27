#!/bin/bash
####
# Instead of a circle, we have the following dot metamorphose
#   1 2 3 4 5 6 7 8 9 0
#   . o O o . o O o . 
####
# @since: 2020-07-29
# @author: Stev Leibelt <artodeto@bazzline.net>
####

#store current cursor position
#   this way, the next output is a line below the current position
printf "\0337"

while true;
do
    CURRENT_SECOND=$(date +%S)
    LAST_NUMBER=${CURRENT_SECOND: -1}

    case ${LAST_NUMBER} in
        1|5|9)
            printf "\0338."
            ;;
        2|4|6|8)
            printf "\0338o"
            ;;
        3|7)
            printf "\0338O"
            ;;
        *)
            printf "\0338 "
    esac

    sleep 1
done
