#!/usr/bin/php
<?php
/**
 * link: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-13
 * @result: fastest method for not being case insensitive is "endsWithOne" with 0.012603998184204 seconds.
 * @result: fastest method for being case insensitive is "endsWithOne" with 0.049326181411743 seconds.
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

$methodNamesToRuntime = array(
    'endsWithOne'     => null,
    'endsWithTwo'     => null,
    'endsWithThree'   => null
);

foreach (array(false, true) as $caseInsensitive) {
    foreach ($methodNamesToRuntime as $methodName => &$runtime) {
        $start = microtime(true);
        foreach($testCases as $testCase) {
            $methodName($testCase['haystack'], $testCase['needle'], $caseInsensitive);
        }
        $runtime = (microtime(true) - $start);
    }

    foreach ($methodNamesToRuntime as $methodName => $runtime) {
        $lengthOfMethodName     = strlen($methodName);
        $numberOfWhiteSpaces    = 20 - $lengthOfMethodName;

        echo $methodName . ': ' . str_repeat(' ', $numberOfWhiteSpaces) . ' ' . $runtime . ' seconds.' . PHP_EOL;
    }

    natsort($methodNamesToRuntime);
    reset($methodNamesToRuntime);
    $fastestMethod = key($methodNamesToRuntime);

    echo PHP_EOL;
    echo 'fastest method for ' . ($caseInsensitive ? '' : 'not ') .
        'being case insensitive is "' . $fastestMethod . '" with ' .
        $methodNamesToRuntime[$fastestMethod] . ' seconds.' . PHP_EOL;
}

//functions
function getRandomString($length = 8, $charString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
    $string = '';
    $randomMax = strlen($charString)-1;

    for(;$length--;) {
        $string .= $charString[mt_rand(0, $randomMax)];
    }

    return $string;
 }

function endsWithOne($haystack, $needle, $caseInsensitive)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (substr($haystack, -(strlen($needle))) === $needle);
}

function endsWithTwo($haystack, $needle, $caseInsensitive)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (strrpos($haystack, $needle, 0) === (strlen($haystack) - strlen($needle)));
}

function endsWithThree($haystack, $needle, $caseInsensitive)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    $lastIndex = (strlen($haystack) - 1);

    return ($haystack[$lastIndex] === $needle);
}
