<?php

/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-01
 */

$arguments = $argv;

//remove script file name
array_shift($arguments);

$string = implode(' ', $arguments);

echo urlencode($string) . PHP_EOL;
