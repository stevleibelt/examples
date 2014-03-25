<?php
/**
* @author stev leibelt <artodeto@bazzline.net>
* @since 2013-02-22
*/

$arrayWithNoFittingPath = array(
    'foo',
    'bar',
    'baz'
);

$arrayWithFittingPath = array(
    'foo',
    'bar',
    'baz',
    'kumbaya' => array(
        'my' => array(
            'lord' => '',
            'queen' => 'wehhaa'
        )
    )
);

$path = array(
    'kumbaya', 
    'my',
    'lord'
);

$value = 'ohohooo';

$arrayToAdd = createArrayByPath($path, $value);

$mergedArrayWithNoFittingPath = array_replace_recursive($arrayWithNoFittingPath, $arrayToAdd);
$mergedArrayWithFittingPath = array_replace_recursive($arrayWithFittingPath, $arrayToAdd);

echo 'array to add' . PHP_EOL;
echo var_export($arrayToAdd, true);
echo PHP_EOL . 'merged array with no fitting path' . PHP_EOL;
echo var_export($mergedArrayWithNoFittingPath, true);
echo PHP_EOL . 'merged array with fitting path' . PHP_EOL;
echo var_export($mergedArrayWithFittingPath, true);

function createArrayByPath($path, $value)
{
    $currentPathStep = current($path);
    $nextPathStep = next($path);

    return ($nextPathStep !== false) 
	    ? array($currentPathStep => createArrayByPath($path, $value)) 
	    : array($currentPathStep => $value);
}
