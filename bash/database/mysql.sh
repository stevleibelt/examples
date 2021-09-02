#!/bin/bash
####
# @see
#   https://stackoverflow.com/questions/3886478/easiest-way-to-get-count-val-from-mysql-in-bash#6424523
# @author stev leibelt <artodeto@bazzline.net>
# @since 2021-09-01
####

function _net_bazzline_example_bash_mysql ()
{
    echo ":: You have to look inside me to see the example."
    return 0
    #the code below is not working since neither a dbms is installed etc.
    #   but it illustrates how you can do things.
    local DB_PASSWORD='database_password!#1983'
    local DB_NAME='database_name'
    local DB_USERNAME='database_username'

    NUMBER_OF_ENTRIES=$(mysql -u"${DB_USERNAME}" -p"${DB_PASSWORD}" -s -e "SELECT COUNT(*) FROM \`${DB_NAME}\`.\`table_name\` WHERE \`column_name\` <= '<value>';")
}

_net_bazzline_example_bash_mysql
