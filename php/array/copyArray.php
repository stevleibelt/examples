<?php
/**
 * this examples shows you how php is working with a copy an array
 *
 * @author stev leibelt <artodeto.bazzline.net>
 * @since 2014-08-08
 */

/** 
 * string $name
 * array $array
 */
function dumpArray($name, array $array)
{
    echo $name . PHP_EOL;
    echo var_export($array, true) . PHP_EOL;
}

//create first array
$firstArray = array(
    'foo',
    'bar',
    'foobar'
);
//make copy
$secondArray = $firstArray;
//modify first array
array_shift($firstArray);

//output content
dumpArray('first array', $firstArray);
dumpArray('second array', $secondArray);
