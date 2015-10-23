<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-10-23
 */

//some example times
$times = array (
    '11:38:34' => '11:39:46',
    '11:39:55' => '11:40:47',
    '11:41:18' => '11:42:48',
    '11:42:29' => '11:43:49',
    '11:42:55' => '11:43:49',
    '11:43:34' => '11:44:49',
    '11:43:56' => '11:45:50'
);

//easy up time handling
$today = date('Y-m-d');

foreach ($times as $start => $end) {
    $endTimestamp   = strtotime($today . ' ' . $end);
    $startTimestamp = strtotime($today . ' ' . $start);

    $differenceInSeconds = ($endTimestamp - $startTimestamp);

    echo 'started at: ' . date('Y-m-d H:i:s', $startTimestamp) . PHP_EOL;
    echo 'ended at: ' . date('Y-m-d H:i:s', $endTimestamp) . PHP_EOL;
    echo 'difference in seconds: ' . $differenceInSeconds . PHP_EOL;
    echo 'difference in minutes: ' . round(($differenceInSeconds / 60), 2) . PHP_EOL;
    echo PHP_EOL;
}
