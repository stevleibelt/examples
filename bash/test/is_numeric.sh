#!/bin/sh
########
# @see: https://stackoverflow.com/a/13089269
# @author: stevleibelt
# @since: 2013-01-15
########

function _main()
{
  echo "Enter something"
  read VALUE

  # Checks if $1 contains only numbers
  #   Also supports negativ values with the optional -
  if [[ ${VALUE} == ?(-)+([[:digit:]]) ]]; 
  then
    echo ">>${VALUE}<< is numeric"
  else 
    echo ">>${VALUE}<< is not numeric"
  fi
}

_main
