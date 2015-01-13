<?php
/**
 * simple command that outputs some lines
 * 
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

if ($argc != 3) {
    echo 'usage: ' . basename(__FILE__) . ' <identifier> <runtime in seconds>' . PHP_EOL;
    exit (1);
}

$identifier = $argv[1];
$runTime = $argv[2];

$pathToPidFile = __DIR__ . '/' . $identifier . '.pid';
file_put_contents($pathToPidFile, time());

$endTime = time() + $runTime;

while ((time() <= $endTime)) {
    echo $identifier . ': ' . microtime() . PHP_EOL;
    usleep(500000); //wait for half a second
}

unlink($pathToPidFile);
