#!/bin/bash
####
# Executes a sql delete from table for multiple times with a sleep.
# Outputs the runtime of the sql statement.
# Has a dry-run/test option.
####
# @since: 2025-03-05
# @author: stev leibelt <artodeto@bazzline.net>
####

function _print_usage()
{
  echo ":: USAGE"
  echo "   ${0} -u <string: db_username> -p <string: db_password> -d <string: database_name> -t <string: table_name> [-h <string: db_hostname=${DB_HOST}][-l <int: deletion_limit=${SQL_DELETE_LIMIT}] [-s <int: sleep_between_iterations=${LOOP_SLEEP_BETWEEN_ITERATIONS}] [-n <int: number_of_iterations=${LOOP_SLEEP_BETWEEN_ITERATIONS}] [-i]"
  echo ""
  echo "-d  - Database name"
  echo "-h  - Database hostname, default: ${DB_HOST}"
  echo "-i  - Execute a inspection run without executing the delete statement, dry run and test could not be used as abbreviation"
  echo "-l  - SQL limit to use, default: ${SQL_DELETE_LIMIT}"
  echo "-n  - Number of iterations to execute the delete statement, default: ${LOOP_NUMBER_OF_ITERATIONS}"
  echo "-p  - Database password"
  echo "-s  - Sleep in seconds to use between iterations, default: ${LOOP_SLEEP_BETWEEN_ITERATIONS}"
  echo "-t  - Database table name"
  echo "-u  - Database username"
}

function _main ()
{
  # bo: variable
  local CURRENT_OPT_ITERATOR
  
  local DB_HOST
  local DB_NAME
  local DB_PASS
  local DB_USER

  local IS_INSPECTION_RUN

  local LOOP_CURRENT_ITERATION
  local LOOP_NUMBER_OF_ITERATIONS
  local LOOP_SLEEP_BETWEEN_ITERATIONS

  local MANDATORY_ARGUMENT_ITERATOR
  local MANDATORY_ARGUMENT_LIST

  local RUNTIME_END_TIME
  local RUNTIME_SQL
  local RUNTIME_START_TIME

  local SQL_DELETE_LIMIT
  local SQL_DELETE_TABLE

  DB_HOST="localhost"
  DB_NAME=""
  DB_PASS=""
  DB_USER=""

  IS_INSPECTION_RUN=0

  LOOP_NUMBER_OF_ITERATIONS=100
  LOOP_SLEEP_BETWEEN_ITERATIONS=30

  MANDATORY_ARGUMENT_LIST=( "DB_NAME" "DB_PASS" "DB_USER" "SQL_DELETE_TABLE" )

  SQL_DELETE_LIMIT=1000000
  SQL_DELETE_TABLE=""
  # eo: variable

  # bo: user input
  # Parse command line arguments
  while getopts "d:h:il:n:p:s:t:u:" CURRENT_OPT_ITERATOR;
  do
    case $CURRENT_OPT_ITERATOR in
      d)
        DB_NAME="${OPTARG}"
        ;;
      h)
        DB_HOST="${OPTARG}"
        ;;
      i)
        IS_INSPECTION_RUN=1
        ;;
      l)
        SQL_DELETE_LIMIT="${OPTARG}"
        ;;
      n)
        LOOP_NUMBER_OF_ITERATIONS="${OPTARG}"
        ;;
      p)
        DB_PASS="${OPTARG}"
        ;;
      s)
        LOOP_SLEEP_BETWEEN_ITERATIONS="${OPTARG}"
        ;;
      t)
        SQL_DELETE_TABLE="${OPTARG}"
        ;;
      u)
        DB_USER="${OPTARG}"
        ;;
      *)
        _print_usage
        exit 0
        ;;
    esac
  done
  # eo: user input

  # bo: mandatory variable test
  
  for MANDATORY_ARGUMENT_ITERATOR in "${MANDATORY_ARGUMENT_LIST[@]}"
  do
    if [[ -z "${!MANDATORY_ARGUMENT_ITERATOR}" ]];
    then
      echo ":: Mandatory argument ${MANDATORY_ARGUMENT_ITERATOR} is missing."
      _print_usage
      exit 1
    fi
  done
  # eo: mandatory variable test

  # bo: core logic
  SQL_STATEMENT="DELETE FROM ${SQL_DELETE_TABLE} LIMIT ${SQL_DELETE_LIMIT};"

  for LOOP_CURRENT_ITERATION in $(seq 1 "${LOOP_NUMBER_OF_ITERATIONS}")
  do
    if [[ "${IS_INSPECTION_RUN}" -gt 0 ]];
    then
      echo ":: Inspection run, would call following command"
      echo "   mariadb -h \"${DB_HOST}\" -u \"${DB_USER}\" -p\"${DB_PASS}\" \"${DB_NAME}\" -e \"${SQL_STATEMENT}\""
      echo "   sleep ${LOOP_SLEEP_BETWEEN_ITERATIONS}"
    else
      RUNTIME_START_TIME=$(date +%s)
      if ! mariadb -h "${DB_HOST}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "${SQL_STATEMENT}";
      then
        echo ":: Error occured during iteration ${LOOP_CURRENT_ITERATION}"
        echo "   Stopping script"
        break
      fi
      RUNTIME_END_TIME=$(date +%s)
      RUNTIME_SQL=$((RUNTIME_END_TIME - RUNTIME_START_TIME))

      echo "   Iteration: [${LOOP_CURRENT_ITERATION}/${LOOP_NUMBER_OF_ITERATIONS}], Runtime of SQL in seconds: ${RUNTIME_SQL}"

      sleep "${LOOP_SLEEP_BETWEEN_ITERATIONS}"
    fi
  done
}

_main "${@}"
