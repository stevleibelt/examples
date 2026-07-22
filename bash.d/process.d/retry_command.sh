#!/bin/bash
####
# Executes a command
# All actions are logged to a log file
#
# Tries the command every x seconds until the execution was successfull.
# If sucessfull:
#   * A .done file is created
#   * The script stops running
# If not sucessfull:
#   * The command is retried after x seconds
####
# @author: Stev Leibelt <artodeto@bazzline.net>
# @since: 2026-07-22
####

# -e: (erexit) Stop script if executed command returns non-zero exitcode except in an if-condition
# -o pipefail: Non-zero exit code of a command is used as the exit code of this script
# -u: (nounset) Stop script if a variable is used but was never set
set -euo pipefail

function _add_to_log_file() {
    local CURRENT_DATETIME

    CURRENT_DATETIME="$(date '+%Y-%m-%d %H:%M:%S')"

    echo "[${CURRENT_DATETIME}] ${2}" >> "${1}"
}

function _main() {
    local COMMAND
    local DONE_FILE
    local LOG_FILE
    local MESSAGE
    local SECONDS_TO_SLEEP

    #@TODO: Adapt this command
    COMMAND=(awk 'BEGIN{srand(); exit (rand()<0.5)?0:1}')
    DONE_FILE="retry_command.done"
    LOG_FILE="retry_command.log"
    SECONDS_TO_SLEEP=60

    while true;
    do
        if [[ -f "${DONE_FILE}" ]];
    then
        MESSAGE="[INFO]: ${DONE_FILE} exists, stopping script ..."
        _add_to_log_file "${LOG_FILE}" "${MESSAGE}"
        return 0
    fi

    _add_to_log_file "${LOG_FILE}" "[DEBUG]: Starting command"

    if "${COMMAND[@]}";
    then
        _add_to_log_file "${LOG_FILE}" "[DEBUG]: Command successful"
        _add_to_log_file "${LOG_FILE}" "[DEBUG]: Creating ${DONE_FILE}"
        touch "${DONE_FILE}"

        return 0
    else
        _add_to_log_file "${LOG_FILE}" "[DEBUG]: Command returned ${?}"
    fi

    _add_to_log_file "${LOG_FILE}" "[DEBUG]: Sleeping for ${SECONDS_TO_SLEEP} seconds."
    sleep ${SECONDS_TO_SLEEP}
    done
}

_main "${@}"
