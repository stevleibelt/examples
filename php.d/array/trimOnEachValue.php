<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-04
 */

if (version_compare(PHP_VERSION, '5.3.0') >= 0) {
    $array = array(
        'nothing to trim',
        ' trim my front',
        'trim my back ',
        ' trim both sides '
    );
    $backup = $array;

    array_walk($array, function (&$value) { $value = trim($value); });

    echo 'original array values: ' . PHP_EOL . var_export($backup, true) . PHP_EOL;
    echo 'trimmed array values: ' . PHP_EOL . var_export($array, true) . PHP_EOL;
} else {
    echo 'Closures are used in this example. Closures are available since php 5.3.0, you have to upgrade to run this example' . PHP_EOL;
}
