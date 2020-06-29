####
# @see: https://www.cyberciti.biz/faq/bash-prepend-text-lines-to-file/
#
# Example how you can prepend content to a file.
# Other options are using a temporary file file.
#   * echo "new content" > tempfile
#   * cat file >> tempfile
#   * mv tempfile file
#
# @author stev leibelt <artodeto@bazzline.net>
# @since 2017-12-13
####

echo -e "####start of initial content\ninitial content\n####end of the initial content" > foo

echo ":: Current content of the file."

cat foo

echo ""
echo -e "and more\nto\ncome\n####\n$(cat foo)" > foo

echo ":: File with some prepended lines."

cat foo

echo ""

rm foo
