:: This is a default one line comment.
:: @see: https://stackoverflow.com/questions/12407800/which-comment-style-should-i-use-in-batch-files?noredirect=1&lq=1
:: You can also use the bat goto comments if you want to write a larger amount of comments
@ECHO OFF
goto :StartOfTheCode
================
large_comments.bat

Usage:
    large_comments [/?] | [/f] <path of the input file> [<path of the output file>]

Switches:
    /?                          - Printing this menu
    /f                          - Forcing to overwrite output path if exists
    <path of the input file>    - source file
    <path of the output file>   - result file (default is <path of the input file>.foo)

:StartOfTheCode
echo "Hello"
