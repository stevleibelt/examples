#!/bin/bash
########
# @author stevleibelt
# @since 2012-11-26
# @see  http://www.linuxjournal.com/content/bash-arrays
#       http://www.tldp.org/LDP/abs/html/arrays.html
#       https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
########

function _main()
{
  ####
  # syntax            result
  #
  # array=()          create an empty array
  # array=(1 2 3)     initialize an array
  # ${array[2]}       retrieve third element
  # ${array[@]}       retrieve all elements
  # ${!array[@]}      retrieve array indices
  # ${#array[@]}      calculate array size
  # array[0]=3        overwrite first element
  # array+=(4)        append value(s)
  # string=$(ls)      save ls output as a string
  # array( $(ls )     save ls output as an array of files
  # ${array[@]:s:n}   retrieve n elements starting at index s
  ####

  #a working array example in sh
  #see: https://unix.stackexchange.com/a/323535
  ARRAY=""
  ARRAY="${ARRAY} there"
  ARRAY="${ARRAY} is"
  ARRAY="${ARRAY} no"
  ARRAY="${ARRAY} foo"
  ARRAY="${ARRAY} without"
  ARRAY="${ARRAY} a"
  ARRAY="${ARRAY} bar"

  echo ":: Outputting array content."
  #as you will see this results in a single line in bash

  for WORD in "${ARRAY}";
  do
    echo "   ${WORD}"
  done

  #array
  #based on http://www.thegeekstuff.com/2010/06/bash-array-tutorial/
  #http://wiki.bash-hackers.org/syntax/arrays
  declare -a ARRAY_ENTRIES=("foo" "bar" "foo bar");

  echo ""
  echo ":: Array has ${#ARRAY_ENTRIES[@]} elements."
  echo "   First entry has ${#ARRAY_ENTRIES} characters."
  echo ":: Adding entry >>baz<< to the array."
  #add entry to the array
  ARRAY_ENTRIES+=("baz")

  #the quotes are important to deal with string containing whitespaces
  #@see: http://stackoverflow.com/a/30133471
  echo ""
  echo ":: On way of looping through the array."

  for ARRAY_ENTRY in "${ARRAY_ENTRIES[@]}";
  do
    echo "    ${ARRAY_ENTRY}";
  done;

  echo ""
  echo ":: Iterating over the index."

  for ARRAY_INDEX in "${!ARRAY_ENTRIES[@]}";
  do
    echo "   ${ARRAY_ENTRIES[${ARRAY_INDEX}]}"
  done

  #@see: http://www.techrepublic.com/article/using-arrays-in-bash/
  echo ""
  echo ":: An other way of looping through."

  NUMBER_OF_ENTRIES=${#ARRAY_ENTRIES[*]}

  for ((ITERATOR=0;ITERATOR<NUMBER_OF_ENTRIES;++ITERATOR));
  do
    echo "    ${ARRAY_ENTRIES[${ITERATOR}]}"
  done

  echo ""
  echo ":: Fetching the keys to get the content."

  for ARRAY_KEY in "${!ARRAY_ENTRIES[@]}";
  do
    echo "${ARRAY_KEY} => ${ARRAY_ENTRIES["${ARRAY_KEY}"]}";
  done;

  echo ""
  echo ":: Calling two elements, starting from second position"
  echo "   ${ARRAY_ENTRIES[@]:1:2}"

  echo ""
  echo ":: In array"
  #inarray | in array
  if [[ "${ARRAY_ENTRIES[*]}" =~ "bar" ]];
  then
    echo "   There is a bar in the foo!"
  fi

  #size of an array

  echo ""
  echo ":: The array contains ${#ARRAY_ENTRIES[@]} elements"

  #sort array
  echo ""
  echo ":: Sorting array"

  IFS=$'\n' SORTED_ARRAY_ENTRIES=($(sort <<<"${ARRAY_ENTRIES[*]}"))
  unset IFS

  echo ""
  echo ":: Outputting conntent"

  for ARRAY_ENTRY in "${SORTED_ARRAY_ENTRIES[@]}";
  do
    echo "    ${ARRAY_ENTRY}";
  done;

  echo ""
  echo ":: Check if key exists"

  if [[ -z ${ARRAY_ENTRIES[2]} ]];
  then
    echo "   Key >>2<< does not."
  else
    echo "   Key >>2<< exists."
  fi

  if [[ -z ${ARRAY_ENTRIES[99]} ]];
  then
    echo "   Key >>99<< does not."
  else
    echo "   Key >>99<< exists."
  fi

  #remove first internal variable
  #shift
}

_main "${@}"
