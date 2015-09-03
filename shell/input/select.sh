#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

LIST='foo bar foobar baz'

select OPTION in $LIST ; do
    if [ ! -z "$OPTION" ] ; then
        break
    fi
done

echo 'selected: '$OPTION
exit 0
