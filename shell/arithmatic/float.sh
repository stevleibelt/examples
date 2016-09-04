#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-09-04
####

INPUT="5+50*3/20 + (19*2)/7"

FLOAT=$(echo "${INPUT}" | bc -l)
printf "%.3f\n" ${FLOAT}
