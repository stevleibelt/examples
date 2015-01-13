<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

$return = 0;
$command = 'php command.php';
$output = shell_exec($command);

echo PHP_EOL;
echo 'executed command: "' . $command . '"' . PHP_EOL;
echo 'output: ' . PHP_EOL;
echo $output . PHP_EOL;
