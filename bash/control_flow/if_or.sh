#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2023-01-29
####

function _main ()
{
 local NAME="artodeto"
 local WEBPAGE="https://www.bazzline.net"

 if [[ "${NAME}" = "stevleibelt" ]] || [[ "${NAME}" = "artodeto" ]];
 then
   echo ":: Name is either >>stevleibelt<< or >>artodeto<<."
   echo " :-)"
   echo ""
 else
   echo ":: Name is neither >>stevleibelt<< or >>artodeto<<."
   echo " :-("
   echo ""
 fi


 if [[ "${WEBPAGE}" = "https://www.eff.org" ]] || [[ "${NAME}" = "https://fsfe.org" ]];
 then
   echo ":: Name is either >>https://www.eff.org<< or >>https://fsfe.org<<."
   echo " :-)"
   echo ""
 else
   echo ":: Name is neither >>https://www.eff.org<< or >>https://fsfe.org<<."
   echo " :-("
   echo ""
 fi

}

_main ${@}
