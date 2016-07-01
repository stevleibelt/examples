#!/bin/bash
####
# simple example how to ask yes or now questions in a bash environment
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-07-01
####

while true; do
    read -p "is everything ok? [y/n]" yn
    case $yn in
        [Yy]* ) 
            echo "go on an hug someone who looks sad";
            break;;
        [Nn]* )
            echo "go on an get a hug from someone";
            break;;
        * ) echo "Please answer y or n.";;
    esac
done
