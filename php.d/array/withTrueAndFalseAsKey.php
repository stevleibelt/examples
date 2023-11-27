<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-20
 */

$array = array(true, "0" => false);
echo '$array = array(true, "0" => false);' . PHP_EOL;
echo var_export($array, true) . PHP_EOL;

$array = array(true, "0" => false, false => true);

echo '$array = array(true, "0" => false, false => true);' . PHP_EOL;
echo var_dump($array[0]) . PHP_EOL;
echo var_export($array, true) . PHP_EOL;
