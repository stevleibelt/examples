#!/bin/php
<?php
/**
 * check if string has non printable characters
 *
 * @see:
 *  http://php.net/manual/en/function.ctype-print.php
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-08-03
 */

if ($argc < 2) {
    echo 'called with invalid number of arguments' . PHP_EOL;
    echo 'usage:' . PHP_EOL;
    echo '    <command> <string to test> [<string to test> [...]]' . PHP_EOL;
    exit(1);
}

$stringsToCheck = $argv;
//remove first entry since this is the script name
array_shift($stringsToCheck);

foreach ($stringsToCheck as $stringToCheck) {
    $stringContainsNonPrintableCharacters = ctype_print($stringToCheck);

    if ($stringContainsNonPrintableCharacters) {
        echo 'the following string contains non printable characters' . PHP_EOL;
        echo 'the string: ' . $stringToCheck . PHP_EOL;
        echo PHP_EOL;
    }
}
