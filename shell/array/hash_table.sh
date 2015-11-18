#!/bin/bash
########
# @author stevleibelt
# @since 2015-11-18
########

#only works in bash >= 4
#array
#http://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
#it is important to have the space betwee "(" and "["
declare -A ARRAY_ENTRIES=( ["foo"]="bar" ["bar"]="foo" )

echo "Array has "${#ARRAY_ENTRIES[@]}" elements."
echo "First entry has "${#ARRAY_ENTRIES}" characters."
echo "Adding entry \"baz => foz\" to the array."
#add entry to the array
ARRAY_ENTRIES+=(["baz"]="foz")

#! expands the key
for ARRAY_KEY in ${!ARRAY_ENTRIES[@]}; do
    #echo "$ARRAY_KEY - ${ARRAY_ENTRIES["$ARRAY_KEY"]}";
    echo "$ARRAY_KEY => ${ARRAY_ENTRIES["$ARRAY_KEY"]}";
done;

echo ''
echo "Calling two elements, starting from second position: "${ARRAY_ENTRIES[@]:1:2}

#inarray
if [[ ${ARRAY_ENTRIES[*]} == bar ]];  then
  echo "There is a bar in the foo!"
fi

#remove first internal variable
#shift
