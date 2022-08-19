#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2022-08-19
####

function _main ()
{
    local config_file

    config_file="${1:-use_configuration_file.conf}"

    echo "usage:: ${0} [<string: configuration_file_path>]"

    if [[ -f $config_file ]];
    then
        echo ":: Sourcing existing configuration file >>${config_file}<<."
        . $config_file
    else
        echo ":: Creating configuration file >>${config_file}<<."
        foo="bar"
        echo "foo=\"${foo}\"" > $config_file
    fi

    echo ":: There is no foo without a >>${foo}<<." 
    echo "  You should remove file >>${config_file}<<."
}

_main "${@}"
