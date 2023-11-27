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
    if (($i % 100) === 0) {
        echo '.';
        if (($i !== 0)
            && ($i % 8000) === 0) {
            echo PHP_EOL;
        }
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

$methodNamesToRuntime = array(
    'stringReplaceOne' => null,
    'stringReplaceTwo' => null
);

foreach ($methodNamesToRuntime as $methodName => &$runtime) {
    reset($testCases);
    $start = microtime(true);
    foreach ($testCases as $testCase) {
        $methodName($testCase['subject'], $testCase['search'], $testCase['replace']);
    }
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

function stringReplaceOne($subject, $search, $replace)
{
    return (str_replace($search, $replace , $subject));
}

function stringReplaceTwo($subject, $search, $replace)
{
    return (preg_replace('/' . $search . '/', $replace, $subject));
}
