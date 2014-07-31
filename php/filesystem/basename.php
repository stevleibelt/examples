<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2013-12-06
 */

$file = __FILE__;

echo 'file: ' . $file . PHP_EOL;
echo 'basename: ' . basename($file) . PHP_EOL;

$dir = __DIR__;

echo 'dir: ' . $dir . PHP_EOL;
echo 'basename: ' . basename($dir) . PHP_EOL;
