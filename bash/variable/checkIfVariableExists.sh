#!/bin/bash
########
# @author stevleibelt
# @since 2018-07-05
# @see
#   https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
########

function _main ()
{
    local FOO
    FOO="foo"

    if [[ -z ${BAR+x} ]];
    then
        echo ":: Variable BAR does not exist."
    else
        echo ":: Variable BAR does exist."
        echo "   Value is >>${BAR}<<"
    fi

    if [[ -z ${FOO+x} ]];
    then
        echo ":: Variable FOO does not exist."
    else
        echo ":: Variable FOO does exist."
        echo "   Value is >>${FOO}<<"
    fi
}

_main
