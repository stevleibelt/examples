<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-20
 */

date_default_timezone_set('Europe/Berlin');

$date       = '0000-00-00';
$dateTime   = new DateTime($date);

echo 'date: ' . $date . PHP_EOL;
echo 'format(\'Y-md H:i:s\'): ' . $dateTime->format('Y-m-d H:i:s') . PHP_EOL;
echo 'format(\'U\'): ' . $dateTime->format('U') . PHP_EOL;
echo 'strtotime: ' . strtotime($date) . PHP_EOL;
echo 'strtotime (date(\'Ymd H:i:s\'): ' . date('Ymd H:i:s', strtotime($date)) . PHP_EOL;
