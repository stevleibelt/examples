#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-06-25
 * @see:
 *  http://php.net/manual/en/ref.readline.php
 *  http://php.net/manual/en/function.readline.php
 *  http://php.net/manual/en/features.commandline.io-streams.php
 */

if (!function_exists('readline')) {
    echo 'readline not installed' . PHP_EOL;
    exit(1);
}

function completion($input, $index, $length)
{
    echo PHP_EOL;
    echo var_export(readline_info(), true) . PHP_EOL;
    echo var_export(func_get_args(), true) . PHP_EOL;
}

readline_completion_function('completion');

while (true) {
    $line = readline();
    echo 'got line: ' . $line . PHP_EOL;
    readline_add_history($line);

    usleep(500000);
}
