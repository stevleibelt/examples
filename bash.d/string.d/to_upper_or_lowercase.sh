#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-04-04
# @see
#   https://bash.cyberciti.biz/guide/Howto:_convert_string_to_all_uppercase
#   http://stackoverflow.com/questions/14646022/tr-a-z-a-z-shows-error-in-unix
#   https://blog.victormendonca.com/2017/09/19/bash-parameter-expansion/
####

function _main()
{
  local LOCAL_STRING
  local MY_STRING

  if [[ ! -z "${*}" ]];
  then
    echo ":: Outputting your arguments"
    echo ""

    for LOCAL_STRING in "${@}"; do
        echo "   Your argument:  ${LOCAL_STRING}"
        echo "   To uppercase using tr: $(echo ${LOCAL_STRING} | tr [:lower:] [:upper:])"
        echo "   To lowercase using tr: $(echo ${LOCAL_STRING} | tr [:upper:] [:lower:])"
    done
  else
    # or use bash native string manipulation

    MY_STRING="there is no foo without a bar."

    echo ":: Original"
    echo "   ${MY_STRING}"

    echo ":: First character upper case."
    echo "   ${MY_STRING^}"

    echo ":: All characters upper case."
    echo "   ${MY_STRING^^}"

    echo ":: First character lower case."
    echo "   ${MY_STRING,}"

    echo ":: All characters lower case."
    echo "   ${MY_STRING,,}"

    echo ":: Invert first character case."
    echo "   ${MY_STRING~}"

    echo ":: Invert all character cases."
    echo "   ${MY_STRING~~}"
  fi
}

_main "${@}"
