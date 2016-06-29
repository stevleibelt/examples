#!/usr/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-29
 * @see
 *  http://php.net/manual/en/ref.password.php
 *  http://php.net/manual/en/function.password-verify.php
 */

if ($argc < 3) {
    echo 'invalid number of arguments provided' . PHP_EOL;
    echo basename(__FILE__) . ' <password> \'<password hash>\'' . PHP_EOL;
    exit(1);
}

$password       = $argv[1];
$hash           = $argv[2];

$isValid = password_verify($password, $hash);

echo 'your password hash is ' . ($isValid ? '' : 'not ') . 'matching the hash' . PHP_EOL;
