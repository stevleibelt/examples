<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-22
 */

$array = array();
$numberOfArrayEntries = 10;

for ($iterator = 0; $iterator < $numberOfArrayEntries; ++$iterator) {
    $array[] = $iterator;
}

try {
    foreach ($array as $key => $value) {
        if ($key === 4) {
            throw new Exception(
                'exception in foreach loop at position: ' . $key
            );
        }
    }
    echo 'finished without exception' . PHP_EOL;
} catch (Exception $exception) {
    echo 'error:' . PHP_EOL;
    echo $exception->getMessage() . PHP_EOL;
}
