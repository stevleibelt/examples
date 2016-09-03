#!/bin/bash
####
# @author stev leibelt <artodeto@arcor.de>
# @since 2016-09-03
# @see
#   http://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable#10929955
###

FILENAME=$(basename $0)

CURRENT_LINE_NUMBER=0
echo -e "line\t: line"
echo -e "number\t: content"
echo "--------:--------"

while read -r CURRENT_LINE_CONTENT;
do
    echo -e "${CURRENT_LINE_NUMBER}\t: ${CURRENT_LINE_CONTENT}"
    ((++CURRENT_LINE_NUMBER))
done < "${FILENAME}"
