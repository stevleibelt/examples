<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-24
 */

$string = ($argc > 1) ? $argv[1] : 'example string';

echo 'sha1 of "' . $string . '" is' . PHP_EOL . sha1($string) . PHP_EOL;
