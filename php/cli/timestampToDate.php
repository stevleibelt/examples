<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-29
 */

$filePath = array_shift($argv);
$timestamps = $argv;

foreach ($timestamps as $timestamp) {
    echo $timestamp . ' -> ' . date('Y-m-d H:i:s', $timestamp) . PHP_EOL;
}
