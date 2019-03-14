#!/bin/env php
<?php
/**
 * @see https://stackoverflow.com/questions/3319386/php-get-last-week-number-in-year
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2019-03-14
 */

$year = ($argc > 1) ? $argv[1] : date('Y');

$dateTime = new DateTime();
$dateTime->setISODate($year, 53);

$yearHas53CalendarWeeks = ($dateTime->format('W') === '53');

if ($yearHas53CalendarWeeks) {
    echo ':: The year >>' . $year . '<< has 53 calendar weeks.' . PHP_EOL;
} else {
    echo ':: The year >>' . $year . '<< has 52 calendar weeks.' . PHP_EOL;
}
