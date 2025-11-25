#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2025-11-25
####

function _main ()
{
 local NAME="artodeto"
 local WEBPAGE="https://www.bazzline.net"

 if [[ "${NAME}" = "artodeto" ]] && [[ "${WEBPAGE}" = "https://www.bazzline.net" ]];
 then
   echo ":: Name is artodeto and webpage is https://www.bazzline.net"
   echo " :-)"
   echo ""
 else
   echo ":: Either name is not artodeto or webpage is not https://www.bazzline.net"
   echo " :-("
   echo ""
 fi
}

_main ${@}
