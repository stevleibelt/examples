#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-06
 */

$shortOptions = 'm:c::d';
$longOptions = array(
    'message:',     //required value
    'command::',    //optional value
    'debug'         //optional flag (no value)
);

$options = getopt($shortOptions, $longOptions);

$message    = (isset($options['m'])) ? $options['m'] : ((isset($options['message'])) ? $options['message'] : null);
$command    = (isset($options['c'])) ? $options['c'] : ((isset($options['command'])) ? $options['command'] : null);
$debug      = (isset($options['d'])) ? true : (isset($options['debug']));

if (is_null($message)) {
    echo 'Usage: getopt.php -m"message" [-c"command"] [-d]' . PHP_EOL;
    echo 'Usage: getopt.php --message "message" [--command "command"] [--debug]' . PHP_EOL;

    return 1;
}

echo 'message: "' . $message . '"' . PHP_EOL;

if (!is_null($command)) {
    echo 'command: "' . $command . '"' . PHP_EOL;
}

if ($debug) {
    echo PHP_EOL . 'debug information' . PHP_EOL;
    echo '$argv: ' . PHP_EOL . var_export($argv, true) . PHP_EOL;
    echo 'getopt: ' . PHP_EOL . var_export($options, true) . PHP_EOL;
}
