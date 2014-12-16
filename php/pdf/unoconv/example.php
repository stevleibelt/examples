<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10
 *
 * build and tested under:
 *  Linux <host name> 3.17.6-1-ARCH #1 SMP PREEMPT Sun Dec 7 23:43:32 UTC 2014 x86_64 GNU/Linux
 */

require_once 'Command.php';
require_once 'ConvertToPdfCommand.php';

$destinationFilePath    = __DIR__ . '/example.pdf';
$sourceFilePath         = __DIR__ . '/../resources/example.odg';

$convert    = new ConvertToPdfCommand();

try {
    $convert->validateEnvironment();

    $lines = $convert->convert($sourceFilePath, $destinationFilePath);

    foreach ($lines as $line) {
        echo $line . PHP_EOL;
    }
} catch (Exception $exception) {
    echo 'error occurred:' . PHP_EOL;
    echo 'exception type: '  . get_class($exception) . PHP_EOL;
    echo 'exception message: ' . $exception->getMessage() . PHP_EOL;
    echo '----' . PHP_EOL;
    echo $exception->getTraceAsString();
}
