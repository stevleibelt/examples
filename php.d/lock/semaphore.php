<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-09-08
 * @see https://secure.php.net/manual/en/book.sem.php
 */

if (!function_exists('sem_get')) {
    exit('PHP is not compiled with System V semaphore support' . PHP_EOL);
}
$semaphore = sem_get(__FILE__);
echo var_export($semaphore) . PHP_EOL;

if (sem_acquire($semaphore)) {
    echo 'could acquire the semaphore' . PHP_EOL;
} else {
    echo 'could not acquire the semaphore' . PHP_EOL;
}
