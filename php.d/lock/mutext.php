<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-09-08
 * @see https://secure.php.net/manual/en/class.mutex.php
 */

if (!class_exists('Mutex')) {
    exit('Mutex not installed, try to install PECL pthreads >= 2.0.0' . PHP_EOL);
}
$mutex = Mutex::create();
echo var_export($mutex, true) . PHP_EOL;

Mutex::lock($mutex);
echo var_export($mutex, true) . PHP_EOL;

Mutex::unlock($mutex);
echo var_export($mutex, true) . PHP_EOL;

Mutex::destroy($mutex);
echo var_export($mutex, true) . PHP_EOL;
