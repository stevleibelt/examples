<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-11-04
 */

$collectionOfDateTimes = $argv;

foreach ($collectionOfDateTimes as $dateTime) {
    echo $dateTime . ' -> ' . strtotime($dateTime) . PHP_EOL;
}
