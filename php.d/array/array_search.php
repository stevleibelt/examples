<?php
/**
 * get array key/index by value
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-25
 */

$array = array(
    'foo',
    'bar',
    'bar',
    'baz'
);

$keyIndexOfBar = array_search('bar', $array);

echo 'dumping array' . PHP_EOL;
echo var_export($array, true) . PHP_EOL;
echo '----' . PHP_EOL;
echo 'first key index of bar: ' . $keyIndexOfBar . PHP_EOL;
