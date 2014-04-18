<?php
/**
* Compares directoryIterator and readdir
*
* @author artodeto
* @since 2013-03-06
* @see http://jdhsu.blogspot.de/2010/01/9-ways-to-iterate-over-directory-in-php.html
*/

$path = '../';

$memorySizeBeforeDirectoryIterator = memory_get_usage(true);
$timeBeforeDirectoryIterator = microtime();

$directoryIterator = new DirectoryIterator($path);
$countedNumberOfDirectoryIteratorEntries = 0;

foreach ($directoryIterator as $iteratorItem) {
    $countedNumberOfDirectoryIteratorEntries++;
}

$timeAfterDirectoryIterator = microtime();
$memorySizeAfterDirectoryIterator = memory_get_usage(true);

unset($directoryIterator);

$memorySizeBeforeReadDir = memory_get_usage(true);
$timeBeforeDirectoryReadDir = microtime();

$countedNumberOfReadDirEntries = 0;

if ($directoryHandler = opendir($path)) {
    while (false !== ($entry = readdir($directoryHandler))) {
        $countedNumberOfReadDirEntries++;
    }

    closedir($directoryHandler);
}

$timeAfterReadDir = microtime();
$memorySizeAfterReadDir = memory_get_usage(true);

unset($directoryHandler);

echo '----------------' . PHP_EOL;
echo 'memory usage' . PHP_EOL;
echo '--------' . PHP_EOL;
echo 'Directory Iterator: ' . ($memorySizeAfterDirectoryIterator - $memorySizeBeforeDirectoryIterator) . PHP_EOL;
echo 'readdir: ' . ($memorySizeAfterReadDir - $memorySizeBeforeReadDir) . PHP_EOL;
echo '----------------' . PHP_EOL;
echo 'time consumption' . PHP_EOL;
echo '--------' . PHP_EOL;
echo 'Directory Iterator: ' . ($timeAfterDirectoryIterator - $timeBeforeDirectoryIterator) . PHP_EOL;
echo 'readdir: ' . ($timeAfterReadDir - $timeBeforeDirectoryReadDir) . PHP_EOL;
echo '----------------' . PHP_EOL;
echo 'Number of entries' . PHP_EOL;
echo '--------' . PHP_EOL;
echo 'Directory Iterator: ' . $countedNumberOfDirectoryIteratorEntries . PHP_EOL;
echo 'readdir: ' . $countedNumberOfReadDirEntries . PHP_EOL;
