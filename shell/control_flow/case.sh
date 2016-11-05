#!/bin/bash
####
# @author stev leibelt <artodeto@arcor.de>
# @since 2016-10-25
####

echo ":: input a, b, c, C or die"
read -p "   " USER_INPUT

case ${USER_INPUT} in
    a)  echo "Your input was \"a\""
        ;;
    b)  echo "Your input was \"b\""
        ;;
    [cC])  echo "Your input was \"c\" or \"C\""
        ;;
    "die")  echo "Your input was \"die\""
        ;;
    *)  echo "Not supported user input"
        ;;
esac
