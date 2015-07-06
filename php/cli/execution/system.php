<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

$return = 0;
$command = 'php command.php';
$line = system($command, $return);

echo PHP_EOL;
echo 'executed command: "' . $command . '"' . PHP_EOL;
echo 'last line: ' . $line . PHP_EOL;
echo 'exit code: ' . $return . PHP_EOL;
