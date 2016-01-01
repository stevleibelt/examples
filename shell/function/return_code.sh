#!/bin/bash
####
# how to react on executed commands return code
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2015-09-03
####

ls -halt .
echo 'previous command returned return code: "'$?'"'

ls -halt /root
echo -e "\e[41m" #set background to bold red: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
echo ''
echo 'previous command returned return code: "'$?'"'
echo -e "\e[0m" #reset font
