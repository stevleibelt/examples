<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-18
 */

function outputPaths(array $paths)
{
    echo '----------------' . PHP_EOL;
    foreach ($paths as $index => $path) {
        echo (is_string($index) ? $index . ': ' : '') . 
            (is_scalar($path) ? $path : var_export($path, true)) . 
            PHP_EOL;
    }
}

function convertPathToArray($path)
{
    if ($path[0] === DIRECTORY_SEPARATOR) {
        //remove first DIRECTONRY_SEPARATOR to avoid empty key
        $path = substr($path, 1);
    }

    $array = explode(DIRECTORY_SEPARATOR, $path);

    return $array;
}

function removeSameKeys(array $one, array $two)
{
    reset($one);
    reset($two);
    $array  = array(
        0 => $one, 
        1 => $two
    );

    foreach ($one as $key => $value) {
        if ((isset($two[$key]))
            && ($value === $two[$key])) {
            unset($array[0][$key]);
            unset($array[1][$key]);
        }
    }

    return $array;
}

$first  = __FILE__;
$first  = __DIR__ . '/../loop/while.php';
$second = __DIR__ . '/../cli/argc.php';

outputPaths(array('first' => $first, 'second' => $second));

$first  = convertPathToArray($first);
$second = convertPathToArray($second);

outputPaths(array('first' => $first, 'second' => $second));

list($first, $second) = removeSameKeys($first, $second);

outputPaths(array('first' => $first, 'second' => $second));
