<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-05
 */

$subject = 'a12345-dasd-231';
$patterns = array(
    '/a\d{5}/',
    '/^a\d{5}/',
    '/^a\d{8}/',
    '/$a\d{5}/',
    '/\w/',
    '/\d/'
);

echo 'subject: ' . $subject . PHP_EOL;

foreach ($patterns as $pattern) {
    echo 'pattern: ' . $pattern . PHP_EOL;

    $matches = array();
    preg_match($pattern, $subject, $matches);

    echo 'matches: ' . var_export($matches, true) . PHP_EOL;
}
