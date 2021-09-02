#!/bin/bash
####
# how to react on executed commands return code
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-09-03
####

function _reacting_on_return_code ()
{
    _generate_return_code 0
    echo "   Previous method return code >>${?}<<."

    _generate_return_code 76
    echo "   Previous method return code >>${?}<<."

    echo ":: Demonstrating a wrong usage of the return code."
    _generate_return_code "foo"
    echo "   Previous method return code >>${?}<<."
}

####
# <param> <return_code>
####
function _generate_return_code ()
{
    local RETURN_CODE="${1:-0}"

    return ${RETURN_CODE}
}

echo ":: Executing >>ls -halt .<<."
ls -halt .
echo "   Previous command returned return code >>${?}<<."

echo ":: Executing >>ls -halt /root<<."
ls -halt /root
echo -e "\e[41m" #set background to bold red: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
echo ""
echo "   Previous command returned return code >>${?}<<."
echo -e "\e[0m" #reset font

_reacting_on_return_code
