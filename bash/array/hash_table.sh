#!/bin/bash
########
# @author stevleibelt
# @since 2015-11-18
########

#works every where
#super smart way
#@see: https://stackoverflow.com/a/32591963 20220414T15:42:32

MY_MULTI_VALUE_ARRAY=(
    '192.168.1.4/24|tcp|22'
    '192.168.1.4/24|tcp|53'
    '192.168.1.4/24|tcp|80'
    '192.168.1.4/24|tcp|139'
    '192.168.1.4/24|tcp|443'
    '192.168.1.4/24|tcp|445'
    '192.168.1.4/24|tcp|631'
    '192.168.1.4/24|tcp|5901'
    '192.168.1.4/24|tcp|6566'
)

for CURRENT_ROW in "${MY_MULTI_VALUE_ARRAY[@]}"
do
    IFS=$'|' read -r RANGE PROTO PORT <<< "${CURRENT_ROW}"

    echo ":: CURRENT ROW >>${CURRENT_ROW}<< as columns:"
    echo "   RANGE >>${RANGE}<<"
    echo "   PROTO >>${PROTO}<<"
    echo "   PORT >>${PORT}<<"
    echo ""
done

#only works in bash >= 4
#array
#http://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
#it is important to have the space betwee "(" and "["
declare -A ARRAY_ENTRIES=( ["foo"]="bar" ["bar"]="foo" )

echo ":: Array has "${#ARRAY_ENTRIES[@]}" elements."
echo ":: First entry has "${#ARRAY_ENTRIES}" characters."
echo ":: Adding entry \"baz => foz\" to the array."
echo ""
#add entry to the array
ARRAY_ENTRIES+=(["baz"]="foz")

#! expands the key
for ARRAY_KEY in ${!ARRAY_ENTRIES[@]}; do
    echo "   ${ARRAY_KEY} => ${ARRAY_ENTRIES["${ARRAY_KEY}"]}";
done;

echo ""
echo ":: Calling two elements, starting from second position: "${ARRAY_ENTRIES[@]:1:2}
echo ""

#inarray
if [[ ${ARRAY_ENTRIES[*]} == bar ]];
then
  echo ":: There is a bar in the foo!"
fi

#array key or index exist
#@see: http://stackoverflow.com/questions/13219634/easiest-way-to-check-for-an-index-or-a-key-in-an-array
#if [[ ${ARRAY_ENTRIES["bar"]}+exists ]];
if [[ ! -z ${ARRAY_ENTRIES["bar"]} ]];
then
    echo "   Key \"bar\" exists."
fi

#remove first internal variable
#shift
