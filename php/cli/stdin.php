#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-06-25
 * @see:
 *  http://php.net/manual/en/features.commandline.io-streams.php
 *  http://.php.net/manual/en/function.readline.php
 */

$stdin  = fopen('php://stdin', 'r');
$stdout = fopen('php://stdout', 'w');
$stderr = fopen('php://stderr', 'w');

while (true) {
    $line = fgets($stdin);
    echo 'got line: ' . $line . PHP_EOL;

    usleep(500000);
}
