<?php
/**
 * link: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-13
 * @result: fastest method for not being case insensitive is "startsWithFive" with 0.024760007858276 seconds.
 * @result: fastest method for being case insensitive is "startsWithSeven" with 0.024828910827637 seconds.
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
        'haystack'  => getRandomString(mt_rand(1, 7000)),
        'needle'    => getRandomString(mt_rand(1, 2000))
    );
}
echo PHP_EOL;
echo 'done' . PHP_EOL;
echo PHP_EOL;

$methodNamesToRuntime = array(
    'startswithOne'     => null,
    'startswithTwo'     => null,
    'startswithThree'   => null,
    'startswithFour'    => null,
    'startswithFive'    => null,
    'startswithSix'     => null,
    'startswithSeven'   => null
);

foreach (array(false, true) as $caseInsensitive) {
    foreach ($methodNamesToRuntime as $methodName => &$runtime) {
        $start = microtime(true);
        foreach($testCases as $testCase) {
            $methodName($testCase['haystack'], $testCase['needle']);
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

function startsWithOne($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (substr($haystack, 0, strlen($needle)) === $needle);
}

function startsWithTwo($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (preg_match('/^' . preg_quote($needle, '/') . '/', $haystack) > 0);
}

function startsWithThree($haystack, $needle, $caseInsensitive = false)
{
    return (substr_compare($haystack, $needle, 0, strlen($needle), $caseInsensitive) === 0);
}

function startsWithFour($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (strpos($haystack, $needle) === 0);
}

function startsWithFive($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (strncmp($haystack, $needle, strlen($needle)) === 0);
}

function startsWithSix($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (strpos($haystack, $needle, 0) === 0);
}

function startsWithSeven($haystack, $needle, $caseInsensitive = false)
{
    if ($caseInsensitive) {
        $haystack   = strtolower($haystack);
        $needle     = strtolower($needle);
    }

    return (strncmp($haystack, $needle, strlen($needle)) === 0);
}
