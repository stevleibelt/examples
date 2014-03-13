#!/usr/bin/php
<?php
/**
 * link: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-13
 */

echo 'generating test' . PHP_EOL;
$testCases = array();

for ($i=0; $i<10000; ++$i) {
    if (($i % 1000) === 0) {
        echo '.';
    }

    $testCases[] = array(
        'haystack' => getRandomString(mt_rand(1, 7000)),
        'needle' => getRandomString(mt_rand(1, 2000))
    );
}
echo PHP_EOL;
echo 'done';
echo PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithOne($testCase['haystack'], $testCase['needle']);
}
echo 'startswithOne: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithTwo($testCase['haystack'], $testCase['needle']);
}
echo 'startswithTwo: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithThree($testCase['haystack'], $testCase['needle']);
}
echo 'startswithThree: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithFour($testCase['haystack'], $testCase['needle']);
}
echo 'startswithFour: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithFive($testCase['haystack'], $testCase['needle']);
}
echo 'startswithFive: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithSix($testCase['haystack'], $testCase['needle']);
}
echo 'startswithSix: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    startswithSeven($testCase['haystack'], $testCase['needle']);
}
echo 'startswithSeven: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = '';
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }

    return $string;
 }

function startsWithOne($haystack, $needle)
{
    return (substr($haystack, 0, strlen($needle) === $needle));
}

function startsWithTwo($haystack, $needle)
{
    return (preg_match('/^' . preg_quote($needle, '/') . '/', $haystack) > 0);
}

function startsWithThree($haystack, $needle)
{
    return (substr_compare($haystack, $needle, 0, strlen($needle)) === 0);
}

function startsWithFour($haystack, $needle)
{
    return (strpos($haystack, $needle) === 0);
}

function startsWithFive($haystack, $needle)
{
    return (strncmp($haystack, $needle, strlen($needle)) === 0);
}

function startsWithSix($haystack, $needle)
{
    return (strpos($haystack, $needle, 0) === 0);
}

function startsWithSeven($haystack, $needle)
{
    return (strncmp($haystack, $needle, strlen($needle)) === 0);
}
