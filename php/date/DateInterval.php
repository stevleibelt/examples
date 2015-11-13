<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-11-12
 */

//this is a broken/invalid format since it contains "-"
$dateInIso8601Format = 'P0Y2M7DT-1H7M14S';
$dateInIso8601Format = str_replace('-', '', $dateInIso8601Format);

echo 'date interval: ' . $dateInIso8601Format . PHP_EOL;
$dateInterval = new DateInterval($dateInIso8601Format);
echo var_export($dateInterval, true) . PHP_EOL;
