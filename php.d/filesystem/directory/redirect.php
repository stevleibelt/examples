<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2012-05-18
 */

$isCalledFromCLI = (PHP_SAPI === 'cli');

if ($isCalledFromCLI) {
    echo 'redirect does not work from command line' . PHP_EOL;
    exit(1);
} else {
    $location = 'https://bazzline.net';
    header ('Location: ' . $location);
}
