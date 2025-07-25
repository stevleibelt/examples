#!/bin/bash
####
# @since: 2025-05-15
# @author: stev leibelt <artodeto@bazzline.net>
####

function _exit_with_error ()
{
  echo "${1}"

  cd ${CWD}

  exit ${2:10}
}

function _main ()
{
  local CWD
  local SCRIPT_PATH

  CWD=$(pwd)
  SCRIPT_PATH=$(cd $(dirname "${0}"); pwd)

  if [[ ! -f /usr/bin/python ]];
  then
    _exit_with_error ":: Error: /usr/bin/python not found" 20
  fi

  if [[ ! -d "${SCRIPT_PATH}/".venv ]];
  then
    python -m venv .venv
  fi

  source .venv/bin/activate

  pip install --upgrade pip
  pip install -r requirements.txt
}

_main "${@}"
