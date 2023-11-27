#!/usr/bin/env php
<?php
####
# converts a php array file to a json file
####
# @since 2018-07-31
# @author stev leibelt <artodeto@bazzline.net>
####

if ($argc < 2) {
    echo ':: Invalid amount of arguments provided.' . PHP_EOL;
    echo '   ' . basename(__FILE__) . ' <path to the php array file>' . PHP_EOL;

    exit(1);
}

$pathToThePhpArrayFile = $argv[1];

$pathToTheDumpFile  = $pathToThePhpArrayFile . '.json';

echo ':: Dumping in progress' . PHP_EOL;
echo '   File path: ' . $pathToTheDumpFile . PHP_EOL;

file_put_contents(
    $pathToTheDumpFile,
    json_encode(
        require_once(
            $pathToThePhpArrayFile
        ),
        JSON_PRETTY_PRINT
    )
);

echo ':: Done' . PHP_EOL;
