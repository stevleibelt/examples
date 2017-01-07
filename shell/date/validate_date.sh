#!/bin/bash
####
# @author stev leibelt <artodeto.bazzline.net>
# @since 2017-01-07
####

if [[ $# -lt 1 ]];
then
    CURRENT_DATE="19700101"
    CURRENT_DATE=$(date +'%Y%m%d')
else
    CURRENT_DATE="${1}"
fi

DAY=${CURRENT_DATE:6:4}
MONTH=${CURRENT_DATE:4:2}
YEAR=${CURRENT_DATE:0:4}

echo ":: Current Date"
echo "${CURRENT_DATE}"
echo ":: Current Day"
echo "${DAY}"
echo ":: Current Month"
echo "${MONTH}"
echo ":: Current Year"
echo "${YEAR}"

echo ""
echo ":: Date is ..."
if date -d "${YEAR}-${MONTH}-${DAY}" &> /dev/null;
then
    echo "valid"
else
    echo "invalid"
fi
