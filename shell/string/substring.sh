#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-07
#
# links:
#    * http://www.tldp.org/LDP/abs/html/string-manipulation.html
#    * http://stackoverflow.com/questions/15351423/how-to-get-part-of-the-string-in-bash
#    * https://www.linuxquestions.org/questions/linux-newbie-8/simple-bash-script-help-grabbing-part-of-a-string-316917/
####

STRING="FooBar-1.2.3-baz.tar.gz";

#Substringing with positions
#${STRING:<start>:<length>"
FIRST_THREE_CHARACTERS=${STRING:0:3};
FROM_FOURTH_CHARACTER=${STRING:3};
A_PIECE_OF=${STRING:7:5};
LAST_CHARACTER=${STRING: -1};
WITHOUT_THE_EXTENSION=${STRING:0:-3}

echo ":: String"
echo "   ${STRING}"
echo ":: First three characters"
echo "   ${FIRST_THREE_CHARACTERS}"
echo ":: From fourth character"
echo "   ${FROM_FOURTH_CHARACTER}"
echo ":: A piece of"
echo "   ${A_PIECE_OF}"
echo ":: Last charachter"
echo "   ${LAST_CHARACTER}"
echo ":: Without the extension"
echo "   ${WITHOUT_THE_EXTENSION}"
