<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-06
 * @see http://php.net/manual/en/function.preg-replace.php
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
$replacement = 'foo';

echo 'subject: ' . $subject . PHP_EOL;

foreach ($patterns as $pattern) {
    echo 'pattern: ' . $pattern . PHP_EOL;

    $matches = array();
    $modifiedSubject = preg_replace($pattern, $replacement, $subject);

    echo 'modified subject: ' . var_export($modifiedSubject, true) . PHP_EOL;
}
