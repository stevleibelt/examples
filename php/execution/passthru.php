<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-09
 */

$return = 0;
$command = 'php command.php';
passthru($command, $return);

echo PHP_EOL;
echo 'executed command: "' . $command . '"' . PHP_EOL;
echo 'exit code: ' . $return . PHP_EOL;
