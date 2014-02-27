<?php
/**
 * Example for array_diff_assoc
 *
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-05-26
 */

$arrayOne = array(
    'foobar',
    'foo' => 'bar',
    'bar' => 'foo',
    'name' => 'arrayOne',
    'arrayOne' => true,
    'arrayTwo' => false,
    'barfoo'
);

$arrayTwo = array(
    'foo' => 'bar',
    'foobar',
    'barfoo',
    'bar' => 'foo',
    'name' => 'arrayTwo',
    'arrayOne' => false,
    'arrayTwo' => true
);
$diff = array_diff_assoc($arrayOne, $arrayTwo);

echo 'array one' . PHP_EOL . 
    var_export($arrayOne, true) . PHP_EOL;
echo 'array two' . PHP_EOL . 
    var_export($arrayTwo, true) . PHP_EOL;
echo PHP_EOL . PHP_EOL;
echo 'array_diff_assoc' . PHP_EOL . 
    var_export($diff, true);
