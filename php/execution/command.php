<?php
/**
 * simple command that outputs some lines
 * 
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

if (isset($argv[1])) {
    echo 'identifier: ' . $argv[1] . PHP_EOL;
}

$maximumNumberOfLines = 4;
$maximumNumberOfCharacters = 80;

for ($numberOfLines = 0; $numberOfLines < $maximumNumberOfLines; ++$numberOfLines) {
    for ($numberOfCharacters = 0; $numberOfCharacters < $maximumNumberOfCharacters; ++$numberOfCharacters) {
        echo '.';
    }
    echo PHP_EOL;
    usleep(500000); //wait for half a second
}
