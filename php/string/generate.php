#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-06-24
 */

if ($argc < 2) {
    echo 'usage: ' . basename(__FILE__) . ' <number of characters>' . PHP_EOL;
    exit(1);
}

$characters                 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ';
$line                       = '';
$numberOfCharacters         = strlen($characters);
$numberOfCharacterIndex     = $numberOfCharacters - 1;
$numberOfCharactersPerLine  = $argv[1];

for ($characterIterator = 0; $characterIterator < $numberOfCharactersPerLine; ++$characterIterator) {
    $index = mt_rand(0, $numberOfCharacterIndex);
    $line .= $characters[$index];
}

echo $line . PHP_EOL;
