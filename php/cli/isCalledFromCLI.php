#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-18
 */

$isCalledFromCommandLineInterface = (PHP_SAPI === 'cli');

if ($isCalledFromCommandLineInterface) {
    echo 'called from command line' . PHP_EOL;
} else {
    echo 'not called from command line (called from "' . PHP_SAPI . '"' . PHP_EOL;
}
