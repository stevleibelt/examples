#!/usr/bin/env php
<?php
####
# converts a json file to a php array file
####
# @since 2018-07-31
# @author stev leibelt <artodeto@bazzline.net>
####

if ($argc < 2) {
    echo ':: Invalid amount of arguments provided.' . PHP_EOL;
    echo '   ' . basename(__FILE__) . ' <path to the json file>' . PHP_EOL;

    exit(1);
}

$pathToTheJsonFile = $argv[1];

$pathToTheDumpFile  = $pathToTheJsonFile . '.php';

echo ':: Dumping in progress' . PHP_EOL;
echo '   File path: ' . $pathToTheDumpFile . PHP_EOL;

file_put_contents(
    $pathToTheDumpFile,
    '<?php' . PHP_EOL . 'return ' .
    var_export(
        json_decode(
            file_get_contents(
                $pathToTheJsonFile
            ),
            true
        ),
        true
    )
);

echo ':: Done' . PHP_EOL;
