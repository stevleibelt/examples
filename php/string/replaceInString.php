<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-06
 * @see http://php.net/manual/en/function.preg-replace.php
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
    methodOne($testCase['haystack'], 'foo', $testCase['needle']);
}
echo 'methodOne: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

$start = microtime(true);
foreach($testCases as $testCase) {
    methodTwo($testCase['haystack'], 'foo', $testCase['needle']);
}
echo 'methodTwo: ' . (microtime(true) - $start) . ' seconds'.PHP_EOL;

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = ''; 
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }   

    return $string;
}

function methodOne($search, $replacement, $string)
{
    return preg_replace('/' . $search . '/', $replacement, $string);
}

function methodTwo($search, $replacement, $string)
{
    return str_replace($search, $replacement, $string);
}
