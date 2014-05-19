<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-05-15
 */

/**
 * @param array $array
 * @return mixed
 */
function getLastKeyFromArrayOne(array $array)
{
    return array_pop(array_keys($array));
}

/**
 * @param array $array
 * @return mixed
 */
function getLastKeyFromArrayTwo(array $array)
{
    end($array);
    $lastKey = key($array);
    reset($array);
    return $lastKey;
}

/**
 * @param int $size
 * @return array
 */
function generateArray($size)
{
    $array = array();
    $iterator = 0;
    while ($iterator < $size) {
        $array[] = $iterator++;
    }

    return $array;
}

$arraySizes = array(10, 100, 1000, 10000, 100000);

foreach ($arraySizes as $size) {
    $array = generateArray($size);
    echo 'test with size: ' . $size . PHP_EOL;
    $start = microtime(true);
    echo 'getLastKeyFromArrayOne: "' . getLastKeyFromArrayOne($array) . '", time: ' . (microtime(true) - $start) . PHP_EOL;
    $start = microtime(true);
    echo 'getLastKeyFromArrayTwo: "' . getLastKeyFromArrayTwo($array) . '", time: ' . (microtime(true) - $start) . PHP_EOL;
    echo '----' . PHP_EOL;
}
