<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

$return = 0;
$lines = array();
$command = 'php command.php';
$line = exec($command, $lines, $return);

echo PHP_EOL;
echo 'executed command: "' . $command . '"' . PHP_EOL;
echo 'general output: ' . var_export($lines, true) . PHP_EOL;
echo 'last line: ' . $line . PHP_EOL;
echo 'exit code: ' . $return . PHP_EOL;
