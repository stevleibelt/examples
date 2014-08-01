<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2013-12-06
 */

$file = __FILE__;

echo 'file: ' . $file . PHP_EOL;
echo 'dirname: ' . dirname($file) . PHP_EOL;

$directory = __DIR__;

echo 'directory: ' . $directory . PHP_EOL;
echo 'dirname: ' . dirname($directory) . PHP_EOL;
