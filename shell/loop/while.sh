#!/bin/bash
ITERATOR=1
LIMIT=10
while [ $ITERATOR -le $LIMIT ]
do
    echo $ITERATOR' run'
    ((++ITERATOR))
    sleep 1s
done
