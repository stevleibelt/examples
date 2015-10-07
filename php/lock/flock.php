<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-09-08
 * @see https://secure.php.net/manual/en/function.flock.php
 */

$firstFileHandler   = fopen(__FILE__, 'r+');
$secondFileHandler  = fopen(__FILE__, 'r+');
$thirdFileHandler   = fopen(__FILE__, 'r+');

$fileHandlerCollection = array(
    'first file handler'    => $firstFileHandler,
    'second file handler'   => $secondFileHandler,
    'third file handler'    => $thirdFileHandler
);

foreach ($fileHandlerCollection as $name => $fileHandler) {
    if (flock($fileHandler, LOCK_SH | LOCK_NB)) {
        echo 'could acquire shared lock for ' . $name . PHP_EOL;
    } else {
        echo 'could not acquire shared lock for ' . $name . PHP_EOL;
    }
}

echo PHP_EOL;

foreach ($fileHandlerCollection as $name => $fileHandler) {
    if (flock($fileHandler, LOCK_EX | LOCK_NB)) {
        echo 'could acquire exclusive lock for ' . $name . PHP_EOL;
    } else {
        echo 'could not acquire exclusive lock for ' . $name . PHP_EOL;
    }
}

echo PHP_EOL;

foreach ($fileHandlerCollection as $name => $fileHandler) {
    if (flock($fileHandler, LOCK_UN)) {
        echo 'could unlock ' . $name . PHP_EOL;
    } else {
        echo 'could not unlock ' . $name . PHP_EOL;
    }
}

echo PHP_EOL;

foreach ($fileHandlerCollection as $name => $fileHandler) {
    if (flock($fileHandler, LOCK_EX | LOCK_NB)) {
        echo 'could acquire exclusive lock for ' . $name . PHP_EOL;
    } else {
        echo 'could not acquire exclusive lock for ' . $name . PHP_EOL;
    }
}

echo PHP_EOL;

foreach ($fileHandlerCollection as $name => $fileHandler) {
    if (flock($fileHandler, LOCK_UN)) {
        echo 'could unlock ' . $name . PHP_EOL;
    } else {
        echo 'could not unlock ' . $name . PHP_EOL;
    }
}

