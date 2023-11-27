#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-16
 */

$command = 'ls *.xml';
$lines = array();
exec($command, $lines);

foreach ($lines as $file) {
    $command = 'diff ' . $file . ' ' . $file . '.cleaned';
    $lines = array();
    exec($command, $lines);

    if (!empty($lines)) {
        echo $file . PHP_EOL;
        echo var_export($lines, true) . PHP_EOL;
        echo PHP_EOL;
    }
}
