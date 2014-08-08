<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-07
 */

$strings = array(
    '01-01-70',
    '01-01-1970',
    '01.01.70',
    '01.01.1970',
    '1970.01.01',
    '1970-01-01',
    '70-01-01',
    '70.01.01',
    'now',
    '6 October 1983',
    '6 Oktober 1983',
    'next Monday',
    'last Thursday',
    '+2 week 4 days 8 hours 16 minutes 32 seconds',
    '-2 week 4 days 8 hours 16 minutes 32 seconds'
);


foreach ($strings as $string) {
    $time = strtotime($string);

    echo PHP_EOL;
    echo 'string: ' . $string . PHP_EOL;
    echo 'as time: ' . $time . PHP_EOL;
    echo 'formatted: ' . date('Y-m-d H:i:s', $time) . PHP_EOL;
    echo '---------------' . PHP_EOL;
}
