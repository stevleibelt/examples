#!/bin/bash
####
# @see
#   https://stackoverflow.com/questions/19059944/convert-kb-to-mb-using-bash - 20230130
#   https://qualitestgroup.com/insights/technical-hub/how-to-find-the-physical-memory-available-on-a-system-through-the-command-line/ - 20230130
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-01-30
####

function _main ()
{
  local LOCAL_MEMORY_SIZE_IN_KB=$(grep MemTotal /proc/meminfo | tr -dc '[:digit:]')

  local LOCAL_MEMORY_SIZE_IN_MB=$(( ${LOCAL_MEMORY_SIZE_IN_KB}/1024 ))

  local LOCAL_MEMORY_SIZE_IN_GB=$(( ${LOCAL_MEMORY_SIZE_IN_MB}/1024 ))

  echo ":: Listing current local memory size in different units."
  echo "   Using pure bash functionality."
  echo "      >>${LOCAL_MEMORY_SIZE_IN_KB}<< KB"
  echo "      >>${LOCAL_MEMORY_SIZE_IN_MB}<< MB"
  echo "      >>${LOCAL_MEMORY_SIZE_IN_GB}<< GB"
  echo ""

  if [[ -f /usr/bin/numfmt ]];
  then
    echo "   Using numfmt."
    numfmt --from-unit=1K --to-unit=1M --round=down ${LOCAL_MEMORY_SIZE_IN_KB}
    numfmt --from-unit=1K --to-unit=1G --round=down ${LOCAL_MEMORY_SIZE_IN_KB}
  fi
}

_main ${@}
