<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-29
 */

$filePath = array_shift($argv);
$strings = $argv;

foreach ($strings as $string) {
    echo $string . ' -> md5:  ' . md5($string) . PHP_EOL;
    echo $string . ' -> sha1: ' . sha1($string) . PHP_EOL;
}
