#!/bin/bash
####
# Puts content into file
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2013-07-09
####

# http://mywiki.wooledge.org/BashGuide/InputAndOutput

touch foo
#overwrite whole content by using "cat >"
#adding content by using "cat >>"
cat > foo <<EOT
This is an example content for the file.
New line and text.
Done
EOT
