#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2022-08-19
####

function store_finished_step ()
{
    echo "${1}" > "${2}"
}

function execute_current_step ()
{
    if [[ $(cat ${2}) -ge ${1} ]];
    then
        echo "Step ${1} already done"
    else
        echo "Executing Step ${1}"

        store_finished_step ${1} ${2}
    fi
}

function _main
{
    local log_file
    local current_step

    echo "usage:: ${0} [<int: already excuted step {0,1,2,3}] [<string: logfile]"

    current_step="${1:-0}"
    log_file="${2:-finished_step.log}"

    if [[ ! -f ${log_file} ]];
    then
        store_finished_step $current_step $log_file
    fi

    execute_current_step 1 ${log_file}

    execute_current_step 2 ${log_file}

    execute_current_step 3 ${log_file}

    echo ":: You should remove or adapt the file >>${log_file}<<."
}

_main ${@}
