#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-22
####

function _main()
{
  if [[ ${#} -ne 2 ]];
  then
      echo 'Usage: '${0}' <file> <linenumber>'
      exit 1
  fi

  head -${2} ${1} | tail -1   # seek to line $2 in file $1 (with head) and output this one column (with tial)

  ##
  # cooler version, faster since we have to read the file once - good for large files
  #
  # TMPFILE='/tmp/tmpfile_'$0
  # head -$2 $1 | tail -1 | tee $TMPFILE   # seek to line $2 in file $1 (with head) and output which is catched by tee and redirects output to tail to read this one column
  # rm -f $TMPFILE

}

_main ${@}
