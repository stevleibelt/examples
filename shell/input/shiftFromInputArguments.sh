#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-01-13
# @see
#   http://stackoverflow.com/questions/21166739/bash-manual-input-and-shift-of-positional-parameters
####

echo 'number of arguments: '$#;
echo 'all arguments: '$@;

if [ "$#" -ge 3 ]; then
    echo 'shifting the first two arguments'
    shift 2
    echo $*
else
    echo 'call me with more then two arguments';
fi
