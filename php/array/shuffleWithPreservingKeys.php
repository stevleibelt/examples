<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-08
 */

/**
 * string $name
 * array $array
 */
function dumpArray($name, array $array)
{
    echo PHP_EOL;
    echo 'name: ' . PHP_EOL;
    echo var_export($array, true) . PHP_EOL;
}

$array = array(
    'foo' => 'bar',
    'bar' => 'foo',
    'foobar' => 'barfoo'
);

$shuffledKeys = array_keys($array);
shuffle($shuffledKeys);
$shuffledArray = array();

foreach ($shuffledKeys as $key) {
    $shuffledArray[$key] = $array[$key];
}

dumpArray('original array', $array);
dumpArray('shuffled array', $shuffledArray);
