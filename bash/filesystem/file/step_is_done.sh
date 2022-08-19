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
    local current_step
    local log_file
    local step_iterator

    echo "usage:: ${0} [<int: already excuted step {0,1,2,3}] [<string: logfile]"
    echo ""

    current_step="${1:-0}"
    log_file="${2:-finished_step.log}"
    step_iterator=1

    if [[ ! -f ${log_file} ]];
    then
        store_finished_step $current_step $log_file
    fi

    execute_current_step ${step_iterator} ${log_file}
    step_iterator=$((step_iterator+1))

    execute_current_step ${step_iterator} ${log_file}
    step_iterator=$((step_iterator+1))

    execute_current_step ${step_iterator} ${log_file}
    step_iterator=$((step_iterator+1))

    echo ":: You should remove or adapt the file >>${log_file}<<."
}

_main ${@}
