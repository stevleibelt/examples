#!/bin/bash
####
# Reads a provided file and only outputs lines in a timeframe of current
#   datetime minus (default) 15 Minutes.
# Expected start of each line is the format YYYY-mm-dd-HH-MM-SS
# All lines not fitting to this format are not evaluated
#
# Usage:
#   <script> <string: path_to_log_file> [<int: timeframe_in_minutes>]
####
# @since: 2024-10-14
# @author: stev leibelt <artodeto@bazzline.net>
####

function _convert_log_time_to_timestamp() {
    	# Convert the log timestamp to a format that date can parse
    	# Replace dashes with spaces and format the date
	date -j -f "%Y-%m-%d-%H-%M-%S" "${1}" +%s 2>/dev/null
}

function _main() {
	local ALLOWED_MINUTES_IN_THE_PAST
	local CURRENT_DATETIME
	local CURRENT_LINE
	local CURRENT_LINE_DATETIME
	local CURRENT_LINE_TIMESTAMP
	local LOG_FILE
	local VALID_TIMESTAMP

	ALLOWED_MINUTES_IN_THE_PAST="${2:-15}"
	CURRENT_DATETIME=$(date +%s)
	LOG_FILE="${1}"
	VALID_TIMESTAMP=$((${CURRENT_DATETIME} - ${ALLOWED_MINUTES_IN_THE_PAST} * 60))

	if [[ -f "${LOG_FILE}" ]];
	then
		while IFS= read -r CURRENT_LINE; do
			if [[ "${CURRENT_LINE}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]];
			then
				CURRENT_LINE_DATETIME=$(echo "${CURRENT_LINE}" | awk '{print $1, $2, $3, $4, $5, $6}')

				CURRENT_LINE_TIMESTAMP=$(_convert_log_time_to_timestamp "${CURRENT_LINE_DATETIME}")

				if [[ "${CURRENT_LINE_TIMESTAMP}" -ge "${VALID_TIMESTAMP}" ]];
				then
					echo "${CURRENT_LINE}"
				fi
			fi

		done < "${LOG_FILE}"
	else
		echo ":: Error"
		echo "   Provided argument is not a valid file path: ${LOG_FILE}"

		exit 10
	fi
}

_main "${@}"
