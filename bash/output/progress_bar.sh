#!/bin/bash
####
# Prints a progress bar
####
# @since: 2021-02-07
# @author: Stev Leibelt <artodeto@bazzline.net>
####

#store current cursor position
#   this way, the next output is a line below the current position
printf "\0337"

CURRENT_ENTRY=0
NUMBER_OF_ENTRIES=10

echo ":: Work in progress"

while true;
do
    if [[ ${CURRENT_ENTRY} -eq 0 ]];
    then
        #initial round
        eval ARRAY_OF_OPEN_ENTRIES=({1..${NUMBER_OF_ENTRIES}})
        OUTPUT="[>"
        OUTPUT+=$(printf '%s' "${ARRAY_OF_OPEN_ENTRIES[@]/*/\ }")
        OUTPUT+="] ( ${CURRENT_ENTRY} / ${NUMBER_OF_ENTRIES} )"
        #reset cursor
        printf "\0338${OUTPUT}"
        ((++CURRENT_ENTRY))
    elif [[ ${CURRENT_ENTRY} -lt ${NUMBER_OF_ENTRIES} ]];
    then
        #most of the stuff
        OUTPUT="["
        eval ARRAY_OF_PROCESSED_ENTRIES=({1..${CURRENT_ENTRY}})
        OUTPUT+=$(printf '%s' "${ARRAY_OF_PROCESSED_ENTRIES[@]/*/=}")
        OUTPUT+=">"
        eval ARRAY_OF_OPEN_ENTRIES=({${CURRENT_ENTRY}..${NUMBER_OF_ENTRIES}})
        OUTPUT+=$(printf '%s' "${ARRAY_OF_OPEN_ENTRIES[@]/*/\ }")
        OUTPUT+="] ( ${CURRENT_ENTRY} / ${NUMBER_OF_ENTRIES} )"
        #reset cursor
        printf "\0338${OUTPUT}"
        ((++CURRENT_ENTRY))
    else
        #final round
        echo -n "["
        eval ARRAY_OF_PROCESSED_ENTRIES=({1..${NUMBER_OF_ENTRIES})
        OUTPUT+=$(printf '%s' "${ARRAY_OF_PROCESSED_ENTRIES[@]/*/=}")
        OUTPUT+=">] ( ${CURRENT_ENTRY} / ${NUMBER_OF_ENTRIES} )"
        #reset cursor
        printf "\0338${OUTPUT}"
        break
    fi

    sleep 1
done
