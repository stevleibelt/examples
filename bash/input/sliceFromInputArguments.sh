#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-03-25
# @see
#   http://stackoverflow.com/questions/5691098/using-command-line-argument-range-in-bash-for-loop
#   http://stackoverflow.com/questions/154625/1-in-bin-sh
#   http://www.tldp.org/LDP/abs/html/comparison-ops.html
#   http://phoxis.org/2010/03/14/read-multiple-arg-bash-script/
#   http://unix.aspcode.net/view/635395087004115229144850/bash-slice-of-positional-parameters
####

echo ":: Number of arguments >>${#}<<"
echo ":: All arguments: >>${@}<<"

if [[ ${#} -ge 3 ]];
then
    echo ":: Outputting argument starting with third one"

    for ARGUMENT in ${@:3} ;
    do 
        echo "   ${ARGUMENT}"; 
    done
else
    echo ":: Please call me with more then two arguments"
fi
