#!/bin/sh
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-25
####

cat <<EOF
foo
bar
baz
`pwd`
foobar
EOF

echo -e '\ndone'
