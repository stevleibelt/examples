#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-29
 * @see
 *  http://php.net/manual/en/ref.password.php
 *  http://php.net/manual/en/function.password-hash.php
 */

if ($argc < 2) {
    echo 'invalid number of arguments provided' . PHP_EOL;
    echo basename(__FILE__) . ' <password>' . PHP_EOL;
    exit(1);
}

$password   = $argv[1];
$hash       = password_hash($password, PASSWORD_DEFAULT);

echo 'password: ' . $password . PHP_EOL;
echo 'hash: ' . $hash . PHP_EOL;
