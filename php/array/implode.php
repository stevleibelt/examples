<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-24
 */

$arrays = array(
    'empty' => array(),
    'empty string' => array(''),
    'single' => array('asd'),
    'single with empty entry first' => array('', 'asd'),
    'single with empty entry last' => array('asd', ''),
    'single with empty entry first and last' => array('', 'asd', ''),
    'multiple' => array('asd', 'qwe'),
    'multiple with empty entry first' => array('', 'asd', 'qwe'),
    'multiple with empty entry last' => array('asd', 'qwe', ''),
    'multiple with empty entry first and last' => array('', 'asd', 'qwe', '')
);

foreach ($arrays as $description =>  $array) {
    echo 'array (' . $description . '):' . PHP_EOL;
    echo var_export($array, true) . PHP_EOL;
    echo 'becomes to "' . implode(',', $array) . '"' . PHP_EOL;
}
