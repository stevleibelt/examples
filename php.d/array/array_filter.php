<?php
/**
 * http://php.net/manual/en/function.array-filter.php
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-23
 */

$array = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

function filterEven($value)
{
    return (($value % 2) === 0);
}

echo 'content of array' . PHP_EOL . 
    var_export($array, true) . PHP_EOL;

//example with callback
echo 'even content of array' . PHP_EOL . 
    var_export(
        array_filter(
            $array, 
            'filterEven'), 
        true
    ) . PHP_EOL;

//example with anonymous function
echo 'odd content of array' . PHP_EOL . 
    var_export(
        array_filter(
            $array, 
            function ($value) {
                return (($value % 2) !== 0);
            }
        ), 
        true
    ) . PHP_EOL;
