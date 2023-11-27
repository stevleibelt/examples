#!/bin/bash

function _build_jar () {
  if [[ ! -f /usr/bin/javac ]];
  then
    echo ":: No javac found."
    echo "   File >>/usr/bin/javac<< does not exist."
    echo ""
    echo "   Please install it."

    return 1
  fi

  if [[ ! -f /usr/bin/fastjar ]];
  then
    echo ":: No fastjar found."
    echo "   File >>/usr/bin/fastjar<< does not exist."
    echo ""
    echo "   Please install it."

    return 2
  fi

  javac Day.java Example.java

  if [[ ${?} -eq 0 ]];
  then
    fastjar cvf functional.jar META-INF Day.class Example.class

    if [[ ${?} -eq 0 ]];
    then
      echo ":: Execute >>java -jar functional.jar<<."
    else
      echo ":: Something went wrong when creating the jar."

      return 3
    fi
  else
    echo ":: Something went wrong when creating the class files."

    return 4
  fi
}

_build_jar ${@}
