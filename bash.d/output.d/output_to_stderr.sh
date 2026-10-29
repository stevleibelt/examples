#!/bin/bash
####
# Output to STDERR example
####
# @since 2026-10-29
# @author stev leibelt <artodeto@bazzline.net>
####

function _echo_to_std_err () {
   #ref: https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr/2990533#2990533
   printf "%s\n" "$*" >&2;
}

function _main() {
  echo "This is printed to STDOUT"
  _echo_to_std_err "This is printed to STDERR"
}

_main "${@}"
