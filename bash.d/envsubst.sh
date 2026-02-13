#!/bin/bash
########
# @ref: https://savannah.gnu.org/projects/gettext
# @ref: https://www.shellhacks.com/envsubst-examples-replace-environment-variables/
# @author stev leibelt <artodeto@bazzline.net>
# @since 2026-02-13
########

function _main()
{
  local CONFIGURATION_FILE
  local FIRST_ARGUMENT
  local SECOND_ARGUMENT
  local TEMPLATE_FILE
  local USED_VARIABLES

  CONFIGURATION_FILE=".envsubst.conf"
  TEMPLATE_FILE=".envsubst.template"
  USED_VARIABLES='${FIRST_ARGUMENT} ${SECOND_ARGUMENT}'

  export FIRST_ARGUMENT="foo"
  export SECOND_ARGUMENT="bar"

  cat > ${TEMPLATE_FILE} <<DELIM
first_argument = \${FIRST_ARGUMENT}
second_argument = \${SECOND_ARGUMENT}
DELIM

  echo "Creating ${CONFIGURATION_FILE} by using ${TEMPLATE_FILE}"
  envsubst "${USED_VARIABLES}" < "${TEMPLATE_FILE}" > ${CONFIGURATION_FILE}
  echo ""
  echo "cat ${TEMPLATE_FILE}"
  cat ${TEMPLATE_FILE}
  echo ""
  echo "cat ${CONFIGURATION_FILE}"
  cat ${CONFIGURATION_FILE}
  echo ""
  echo "Please remove ${CONFIGURATION_FILE} and ${TEMPLATE_FILE} by yourself."
}

_main "${@}"
