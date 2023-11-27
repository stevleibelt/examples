#!/bin/env php
<?php
/**
 * @see http://php.net/manual/en/function.setlocale.php
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-04-29
 */

$currentLocaleLCTime    = setLocale(LC_TIME, 0);
$currentTimestamp       = 0;
$listOfLocale           = [
    'en_US.utf8',
    'en_US',
    'de_DE.utf8',
    'de_DE',
    'en_UK.utf8',
    'en_UK'
];

echo ':: Current locale is "' . $currentLocaleLCTime . '"' . PHP_EOL;

foreach ($listOfLocale as $locale) {
    if (false === setLocale(LC_TIME, $locale)) {
        echo ':: Locale "' . $locale . '" not supported!' . PHP_EOL;
    } else {
        echo ':: Locale set to "' . $locale . '"' . PHP_EOL;
        echo ':: Outputting month and year for timestamp "' . $currentTimestamp . '"' . PHP_EOL;
        echo '   ' . strftime('%B %Y', $currentTimestamp) . PHP_EOL;
    }
}

setLocale(LC_TIME, $currentLocaleLCTime);

echo ':: Finally, locale is "' . setLocale(LC_TIME, 0) . '"' . PHP_EOL;
