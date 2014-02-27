<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-08-29
 */

$array = array(
    'foo',
    'bar'
);
$flipped = array_flip($array);

echo str_repeat('-', 40) . PHP_EOL;
echo 'original array' . PHP_EOL;
echo var_export($array, true);
echo str_repeat('-', 40) . PHP_EOL;
echo 'flipped array' . PHP_EOL;
echo var_export($flipped, true);
echo str_repeat('-', 40) . PHP_EOL;
