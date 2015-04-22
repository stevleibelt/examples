<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

function dumpArray(array $array, $name)
{
    echo 'dumping array "' . $name . '"' . PHP_EOL;
    foreach ($array as $key => $value) {
        echo '    ' . $key . ': ' . ((is_scalar($value)) ? $value : var_export($value, true)) . PHP_EOL;
    }
}

$one = array(
    0 => 1,
    'foo' => 'bar',
    'bar' => 2,
    2 => 'foobar'
);

$two = $one;
$two['bar'] = 'baz';
$difference = array_diff($one, $two);

dumpArray($one, 'initial array');
dumpArray($two, 'modified array');
dumpArray($difference, 'difference');
