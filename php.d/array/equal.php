<?php
/**
 * validate if two arrays are equal
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-28
 */

$objectOne = new stdClass();
$objectTwo = new stdClass();

$array = [
    [
        'bar'       => 'foo',
        'foo'       => 'bar',
        'object'    => $objectOne
    ]
];

$equalArray = [
    [
        'bar'       => 'foo',
        'foo'       => 'bar',
        'object'    => $objectOne
    ]
];

$notEqualArray = [
    [
        'bar'       => 'foo',
        'foo        ' => 'bar',
        'object'    => $objectTwo
    ]
];

function compareArraysOne(array $arrayOne, array $arrayTwo)
{
    echo ':: Array one and array two are ' . (($arrayOne === $arrayTwo) ? 'equal' : 'not equal') . '.' . PHP_EOL;
}

function compareArraysTwo(array $arrayOne, array $arrayTwo)
{
    foreach (array_keys($arrayOne) as $key) {
        if (!array_key_exists($key, $arrayTwo)) {
            echo ':: key >>' . $key . '<< does not exist in arrayTwo!' . PHP_EOL;

            exit(1);
        }

        if (is_array($arrayOne[$key])) {
            compareArraysTwo($arrayOne[$key], $arrayTwo[$key]);
        } else {
            if ($arrayOne[$key] !== $arrayTwo[$key]) {
                echo ':: key >>' . $key . '<< differs'. PHP_EOL;
                echo '   arrayOne: ' . $arrayOne[$key] . PHP_EOL;
                echo '   arrayTwo: ' . $arrayTwo[$key] . PHP_EOL;
            }
        }
    }
}

echo ':: Comparing array with equalArray using compareArraysOne' . PHP_EOL;
compareArraysOne($array, $equalArray);
echo ':: Comparing array with notEqualArray using compareArraysOne' . PHP_EOL;
compareArraysOne($array, $notEqualArray);

echo PHP_EOL;

echo ':: Comparing array with equalArray using compareArraysTwo' . PHP_EOL;
compareArraysTwo($array, $equalArray);
echo ':: Comparing array with notEqualArray using compareArraysTwo' . PHP_EOL;
compareArraysTwo($array, $notEqualArray);
