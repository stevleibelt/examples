<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-09
 * @see
 *  http://de2.php.net/manual/en/function.array-unshift.php
 */

$array = array('three', 'four', 'five');

echo 'array content: ' . var_export($array, true) . PHP_EOL;

array_unshift($array, 'two');
array_unshift($array, array('one'));

echo 'array content: ' . var_export($array, true) . PHP_EOL;
