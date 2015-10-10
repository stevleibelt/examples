#!/usr/bin/php
<?php
/**
 * link: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-13
 * @result fastest method is "startsWithOne" with 0.0226149559021 seconds
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
    endsWithOne($testCase['haystack'], $testCase['needle']);
}
echo 'endsWithOne: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    endsWithTwo($testCase['haystack'], $testCase['needle']);
}
echo 'endsWithTwo: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = '';
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }

    return $string;
 }

function endsWithOne($haystack, $needle)
{
    return (substr($haystack, -(strlen($needle))) === $needle);
}

function endsWithTwo($haystack, $needle)
{
    return (strrpos($haystack, $needle, 0) === (strlen($haystack) - strlen($needle)));
}
