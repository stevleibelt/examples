<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-11
 */

$isWindows = (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN');

echo PHP_OS . ' is ' . ($isWindows ? '' : 'not ') . 'a windows' . PHP_EOL;
