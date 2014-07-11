#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-11
 * @see
 *  http://de2.php.net/manual/en/function.exec.php
 *  http://de1.php.net/manual/en/function.shuffle.php
 */

 $isCalledFromCommandLineInterface = (PHP_SAPI === 'cli');

 try {
     if (!$isCalledFromCommandLineInterface) {
         throw new Exception('this is a command line script only');
     }

     if ($argc < 2) {
         throw new Exception('Usage: ' . basename(__FILE__) . ' <path_to_log_file> [<number_of_iterations>]');
    }

    $numberOfIteration = ($argc > 2) ? $argv[2] : 0;
    $isInitialCall = ($numberOfIteration === 0);
    $pathToLogFile = $argv[1];

    if (!is_file($pathToLogFile)) {
        throw new Exception('provided path "' . $pathToLogFile . '" is not a file');
    }

    if (!is_writable($pathToLogFile)) {
        throw new Exception('provided log file "' . $pathToLogFile . '" is not writable');
    }
    
    $pid = getmypid();

    if ($isInitialCall) {
        file_put_contents($pathToLogFile, $pid . ' initialization started' . PHP_EOL);
        $numberOfIterationPerChildren = array(
            3, 4, 6, 1, 5, 7, 2, 4, 8, 9
        );
        shuffle($numberOfIterationPerChildren);

        foreach ($numberOfIterationPerChildren as $key => $numberOfIteration) {
            file_put_contents($pathToLogFile, $pid . ' starting with ' . $key . ' number of iteration ' . $numberOfIteration . PHP_EOL, FILE_APPEND);
            $command = 'php ' . __FILE__ . ' ' . $pathToLogFile . ' ' . $numberOfIteration;
            exec($command . ' > /dev/null &');
        }

        file_put_contents($pathToLogFile, $pid . ' initialization done' . PHP_EOL);
    } else {
        $iterator = 0;
        $pid = getmypid();

        while ($iterator < $numberOfIteration) {
            file_put_contents($pathToLogFile, $pid . ' iteration number ' . $iterator . PHP_EOL, FILE_APPEND);
            ++$iterator;
            sleep(1);
        }
    }
} catch (Exception $exception) {
    echo $exception->getMessage() . PHP_EOL;
    exit(1);
}
