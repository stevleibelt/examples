<?php
/**
 * validate if $needle is in $array
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-28
 * @todo get it done - yoda says "research some has to be done"
 */

$array = array(
    array(
        'foo' => 'bar',
        'bar' => 'foo'
    )
);

$equalArray = array(
    array(
        'foo' => 'bar',
        'bar' => 'foo'
    )
);

$notEqualArray = array(
    array(
        'foo' => 'baz',
        'bar' => 'foo'
    )
);

function compareArrays(array $arrayOne, array $arrayTwo)
{
    echo 'Array one and array two are ' . (($arrayOne === $arrayTwo) ? 'equal' : 'not equal') . '.' . PHP_EOL;
}

compareArrays($array, $equalArray);
compareArrays($array, $notEqualArray);
