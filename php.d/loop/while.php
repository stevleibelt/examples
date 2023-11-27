<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-24
 */

$maximumNumberOfLoops = rand(4, 9);
$iterator = 0;

echo 'while loop should break at ' . $maximumNumberOfLoops . ' loop' . PHP_EOL;

while (++$iterator < 10) {
    echo '.';
    if ($iterator >= $maximumNumberOfLoops) {
        echo PHP_EOL . 'maximum number of loops (' . $iterator . '/' . $maximumNumberOfLoops . ') reached';
        break;
    }
}
echo PHP_EOL;
