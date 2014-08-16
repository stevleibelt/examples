<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-16
 */


echo 'generating test' . PHP_EOL;
$strings = array();

for ($i=0; $i<10000; ++$i) {
    if (($i % 100) === 0) {
        echo '.';
        if (($i !== 0)
            && ($i % 8000) === 0) {
            echo PHP_EOL;
        }
    }   

    $strings[] = getRandomString(mt_rand(1, 7000));
}

echo PHP_EOL;
echo 'done' . PHP_EOL;
echo PHP_EOL;

$methodNamesToRuntime = array(
    'concatinationOne' => null,
    'concatinationTwo' => null,
    'concatinationThree' => null,
    'concatinationFour' => null
);

foreach ($methodNamesToRuntime as $methodName => &$runtime) {
    reset($strings);
    $start = microtime(true);
    $methodName($strings);
    $runtime = (microtime(true) - $start);
}

foreach ($methodNamesToRuntime as $methodName => $runtime) {
    $lengthOfMethodName = strlen($methodName);
    $numberOfWhiteSpaces = 20 - $lengthOfMethodName;

    echo $methodName . ': ' . str_repeat(' ', $numberOfWhiteSpaces) . ' ' . $runtime . ' seconds.' . PHP_EOL;
}

natsort($methodNamesToRuntime);
reset($methodNamesToRuntime);
$fastestMethod = key($methodNamesToRuntime);

echo PHP_EOL;
echo 'fastest method is "' . $fastestMethod . '" with ' . $methodNamesToRuntime[$fastestMethod] . ' seconds.' . PHP_EOL;

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = ''; 
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }   

    return $string;
}

function concatinationOne(array $strings) {
    foreach ($strings as $string) {
        $concatination = sprintf('there is no foo without a bar %s', $string);
    }
}

function concatinationTwo(array $strings) {
    foreach ($strings as $string) {
        $concatination = "there is no foo without a bar $string";
    }
}

function concatinationThree(array $strings) {
    foreach ($strings as $string) {
        $concatination = "there is no foo without a bar " . $string;
    }
}

function concatinationFour(array $strings) {
    foreach ($strings as $string) {
        $concatination = 'there is no foo without a bar ' . $string;
    }
}
