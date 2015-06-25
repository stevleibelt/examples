<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-06-25
 */

$arrayOne = array(
    'foo',
    'bar',
    'foobar'
);

$arrayTwo = array(
    'foobar',
    'bar',
    'foo'
);

echo 'array one' . PHP_EOL;
echo var_export($arrayOne, true) . PHP_EOL;
echo PHP_EOL;

echo 'array two' . PHP_EOL;
echo var_export($arrayTwo, true) . PHP_EOL;
echo PHP_EOL;

echo '+' . str_repeat('-', 40) . '+' . PHP_EOL;
echo '| it is intended, that errors are thrown |' . PHP_EOL;
echo '+' . str_repeat('-', 40) . '+' . PHP_EOL;
echo PHP_EOL;

echo 'combining with empty first array' . PHP_EOL;
echo var_export(array_combine(array(), $arrayTwo), true) . PHP_EOL;
echo PHP_EOL;

echo 'combining with empty second array' . PHP_EOL;
echo var_export(array_combine($arrayOne, array()), true) . PHP_EOL;
echo PHP_EOL;

echo 'combining two, equal in size, arrays' . PHP_EOL;
echo var_export(array_combine($arrayOne, $arrayTwo), true) . PHP_EOL;
echo PHP_EOL;

echo 'combining with bigger first array' . PHP_EOL;
$array = $arrayOne;
$array[] = 'baz';
echo var_export(array_combine($array, $arrayTwo), true) . PHP_EOL;
echo PHP_EOL;

echo 'combining with bigger second array' . PHP_EOL;
$array = $arrayTwo;
$array[] = 'baz';
echo var_export(array_combine($arrayOne, $array), true) . PHP_EOL;
echo PHP_EOL;
