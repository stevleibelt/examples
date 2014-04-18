<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-18
 */

$filePath = __FILE__;

echo '--------' . PHP_EOL;
echo 'file path' . PHP_EOL;
echo $filePath . PHP_EOL;

//remove first DIRECTONRY_SEPARATOR to avoid empty key
$filePath = substr($filePath, 1);
$explodedFilePath = explode(DIRECTORY_SEPARATOR, $filePath);

echo '--------' . PHP_EOL;
echo 'file path as array' . PHP_EOL;
echo var_export($explodedFilePath, true) . PHP_EOL;

$firstPathPart = array_shift($explodedFilePath);
$filePathAsMultiDimensionalArray = createMultiDimensionalArray($firstPathPart, $explodedFilePath);

echo '--------' . PHP_EOL;
echo 'file path as array' . PHP_EOL;
echo 'file path as multi dimensional array' . PHP_EOL;
echo var_export($filePathAsMultiDimensionalArray, true) . PHP_EOL;

function createMultiDimensionalArray($key, $value, $array = array())
{
    //last value should be a value and not another key
    if ((is_array($value))
        && (count($value) === 1)) {
        $value = array_pop($value);
    }

    if (is_array($value)) {
        $nestedKey = array_shift($value);
        $array[$key] = createMultiDimensionalArray($nestedKey, $value);
    } else {
        $array[$key] = $value;
    }

    return $array;
}
