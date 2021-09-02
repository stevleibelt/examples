#!/bin/bash
####
# Example of how to use heredoc
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-02-02
####

LOCAL_DATE=$(date +'%Y-%m-%d %H:%M:%S')
LOCAL_SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)
LOCAL_IP=$(hostname -i)

LOCAL_LOG_MESSAGE="[$LOCAL_DATE]: $HOSTNAME - $LOCAL_IP"

# either output it
echo ${LOCAL_LOG_MESSAGE}
#or put it into a file
#or use the logger
logger -i -p cron.debug "${LOCAL_LOG_MESSAGE}"
#echo ${LOCAL_LOG_MESSAGE} >> "${LOCAL_SCRIPT_PATH}/logger.log"
