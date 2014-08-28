<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-28
 */

$string = 'bar foo foobar : there is no : foo without a bar';
$needles = array(
    ':',
    ';',
    'foobar'
);


echo 'string: "' . $string . '"' . PHP_EOL;
foreach ($needles as $needle) {
    $firstPosition = strpos($string, $needle);
    $lastPosition = strrpos($string, $needle);

    echo $needle . PHP_EOL;
    echo (($firstPosition !== false) ? 'first position: ' . $firstPosition : 'not found') . PHP_EOL;
    echo (($lastPosition !== false) ? 'last position: ' . $lastPosition : 'not found') . PHP_EOL;
    echo PHP_EOL;
}
