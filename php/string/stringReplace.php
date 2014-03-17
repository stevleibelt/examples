#!/usr/bin/php
<?php
/**
 * link: http://blogs.simplemachines.org/dev/175031/PHP+String+Replacement+Speed+Comparison.html
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-17
 */

echo 'generating test' . PHP_EOL;
$testCases = array();

for ($i=0; $i<10000; ++$i) {
    if (($i % 1000) === 0) {
        echo '.';
    }

    $testCases[] = array(
        'subject' => getRandomString(mt_rand(1, 7000)),
        'search' => getRandomString(mt_rand(1, 2000)),
        'replace' => getRandomString(mt_rand(1, 2000))
    );
}
echo PHP_EOL;
echo 'done';
echo PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    stringReplaceOne($testCase['subject'], $testCase['search'], $testCase['replace']);
}
echo 'stringReplaceOne: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    stringReplaceTwo($testCase['subject'], $testCase['search'], $testCase['replace']);
}
echo 'stringReplaceTwo: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    stringReplaceThree($testCase['subject'], $testCase['search'], $testCase['replace']);
}
echo 'stringReplaceThree: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = '';
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }

    return $string;
 }

function stringReplaceOne($subject, $search, $replace)
{
    return (str_replace($search, $replace , $subject));
}

function stringReplaceTwo($subject, $search, $replace)
{
    return (preg_replace('/' . $search . '/', $replace, $subject));
}

function stringReplaceThree($subject, $search, $replace)
{
    return (strtr($subject , $search , $replace));
}
