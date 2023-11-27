<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-02
 */

$list = array(
    'value one',
    'value two',
    'value three'
);

$hashMap = array(
    'key one' => 'value one',
    'key two' => 'value two',
    'key three' => 'value three'
);

echo 'a list array in php' . PHP_EOL;
echo var_export($list, true) . PHP_EOL;
echo PHP_EOL;
echo 'a hash map array in php' . PHP_EOL;
echo var_export($hashMap, true) . PHP_EOL;
