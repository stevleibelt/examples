#!/bin/bash
####
# Outputs a short version of git commit messages for following filter patterns:
# * Day is saturday or sunday
# * Day is weekday and hour is less than 7 or greater than 17
####
# @since: 2024-10-20
# @author: stev leibelt <artodeto@bazzline.net>
####

git log --pretty=format:"%h %ad" --date=iso | while read line; do
    # extract date components
    date_str=$(echo "$line" | awk '{print $2, $3, $4}')
    
    # get day of the week and hour
    day_of_week=$(date -d "$date_str" +%u)
    hour=$(date -d "$date_str" +%H)

    # echo line if it is saturday (6) or sunday (7)
    if [[ "$day_of_week" -eq 6 || "$day_of_week" -eq 7 ]]; then
        echo "$line"
    # echo line of is a weekday (1-5) and hour is less then 7 or greater than 17
    elif [[ "$day_of_week" -ge 1 && "$day_of_week" -le 5 && ( "$hour" < "07" || "$hour" > "17" ) ]]; then
        echo "$line"
    fi
done
