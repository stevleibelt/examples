<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-13
 */

$numberOfProcess = 8;
$pathToLogFile = __DIR__ . '/log';

/*
if (is_file($pathToLogFile)) {
    unlink($pathToLogFile);
}
 */

echo 'starting ' . $numberOfProcess . ' processes in the background' . PHP_EOL;

for ($iterator = 0; $iterator < $numberOfProcess; ++$iterator) {
    $command = 'php command.php ' . $iterator . ' ' . rand(1,5) . ' >> ' . $pathToLogFile . ' &';
    exec($command);
}

$backgroundProcessesAreRunning = true;

while ($backgroundProcessesAreRunning) {
    $command = 'ls | grep \'\\.pid$\' | wc -l';
    $line = exec($command);
    usleep(500000); //wait for half a second
    echo $line . ' ';
    $backgroundProcessesAreRunning = ((int) $line > 0);
}

echo PHP_EOL;
echo 'done' . PHP_EOL;
