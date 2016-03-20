#!/bin/bash
########
# @author stevleibelt
# @since 2012-11-26
########

#array
#based on http://www.thegeekstuff.com/2010/06/bash-array-tutorial/
#http://wiki.bash-hackers.org/syntax/arrays
declare -a ARRAY_ENTRIES=("foo" "bar" "foo bar");

echo "Array has "${#ARRAY_ENTRIES[@]}" elements."
echo "First entry has "${#ARRAY_ENTRIES}" characters."
echo "Adding entry "baz" to the array."
#add entry to the array
ARRAY_ENTRIES+=("baz")

#the quotes are important to deal with string containing whitespaces
#@see: http://stackoverflow.com/a/30133471
echo ""
echo "On way of looping through the array"
echo ""
for ARRAY_ENTRY in "${ARRAY_ENTRIES[@]}"; do
  echo "    $ARRAY_ENTRY";
done;

echo ""
echo "An other way of looping through"
echo ""
NUMBER_OF_ENTRIES=${#ARRAY_ENTRIES}

for ((ITERATOR=0;ITERATOR<=$NUMBER_OF_ENTRIES;++ITERATOR)); do
    echo "    "${ARRAY_ENTRIES[${ITERATOR}]}
done

echo ""
echo "Calling two elements, starting from second position: "${ARRAY_ENTRIES[@]:1:2}

#inarray
if [[ ${ARRAY_ENTRIES[*]} == bar ]];  then
  echo "There is a bar in the foo!"
fi

#remove first internal variable
#shift
