<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-02-03
 */

function contains($string, $search)
{
    if (strlen($search) == 0) {
        $contains = false;
    } else {
        $contains = !(strpos($string, $search) === false);
    }

    return $contains;
}

$strings = array(
    'this is a string' => 'is a',
    'this is an other string' => 'is a',
    'this is another string' => 'a string'
);


foreach ($strings as $string => $search) {
    echo 'string: ' . PHP_EOL . 
        '    "' . $string . '"' . PHP_EOL . 
        '    ' . (contains($string,$search) ? 'contains' : 'does not contain') .  PHP_EOL . 
        '    "' . $search . '"' . PHP_EOL;
}
