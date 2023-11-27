<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-10
 */

$path       = __DIR__ . '/..';
$directory  = new RecursiveDirectoryIterator($path);
$iterator   = new RecursiveIteratorIterator($directory);

$stringLengthOfTheCurrentPath = strlen($path);

echo 'iterating recursivly through path: ' . PHP_EOL .  $path . PHP_EOL;

foreach ($iterator as $item) {
    echo '    ' . substr($item->getPathname(), $stringLengthOfTheCurrentPath) . PHP_EOL;
}
