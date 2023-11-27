<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-14
 */

$strings = array(
    'foo',
    'bar',
    'baz',
    'foobar',
    'there is no foo without a bar'
);

foreach ($strings as $string) {
    echo 'string: ' . $string . PHP_EOL;
    echo 'first two characters: ' . substr($string, 0, 2) . PHP_EOL;
    echo 'third character and up to ten more: ' . substr($string, 2, 12) . PHP_EOL;
    echo 'last two characters: ' . substr($string, -2) . PHP_EOL;
    echo PHP_EOL;
}
