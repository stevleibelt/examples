#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-29
 * @see
 *  http://php.net/manual/en/ref.password.php
 *  http://php.net/manual/en/function.password-get-info.php
 */

if ($argc < 2) {
    echo 'invalid number of arguments provided' . PHP_EOL;
    echo basename(__FILE__) . ' \'<password hash>\'' . PHP_EOL;
    exit(1);
}

$hash           = $argv[1];
$informations   = password_get_info($hash);

echo 'hash: ' . $hash . PHP_EOL;
echo 'used algorithm: ' . $informations['algoName'] . PHP_EOL;
echo 'algorithm cost: ' . $informations['options']['cost'] . PHP_EOL;
