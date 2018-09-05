#!/usr/bin/php
<?php
/**
 * @see
 *  http://stackoverflow.com/questions/6278296/extract-numbers-from-a-string
 *  http://stackoverflow.com/questions/11243447/get-numbers-from-string-with-php
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-10-28
 */

function toNumbers($string)
{
    return filter_var($string, FILTER_SANITIZE_NUMBER_INT);
}

echo ':: Important, FILTER_SANITIZE_NUMBER_INT returns numbers *plus* - and +' . PHP_EOL;

$strings = array(
    'foo',
    'bar',
    'f12r',
    '12f',
    'f23',
    '2d23ad2',
    '2d23-ad2',
    'sad3.312asd2,23'
);

foreach ($strings as $string) {
    echo '   String: "' . $string . '"' . PHP_EOL .
        '   Contains following numbers: ' . toNumbers($string) . PHP_EOL;
}
