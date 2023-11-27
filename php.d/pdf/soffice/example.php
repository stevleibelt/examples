<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10
 *
 * build and tested under:
 *  Linux <host name> 3.17.6-1-ARCH #1 SMP PREEMPT Sun Dec 7 23:43:32 UTC 2014 x86_64 GNU/Linux
 */

require_once 'Command.php';
require_once 'ConvertOdtToPdfCommand.php';
require_once 'ReplaceStringsInFileCommand.php';
require_once 'ZipCommand.php';

$pathToZipArchive   = 'example';
$pathToContentXml   = $pathToZipArchive . '/content.xml';
$sourceFilePath     = __DIR__ . '/../resources/example.odt';

$convert    = new ConvertOdtToPdfCommand();
$replace    = new ReplaceStringsInFileCommand();
$zip        = new ZipCommand();

try {
    $convert->validateEnvironment();
    $replace->validateEnvironment();
    $zip->validateEnvironment();

    mkdir($pathToZipArchive);
    $lines = $zip->unzip($sourceFilePath, $pathToZipArchive);

    foreach ($lines as $line) {
        echo $line . PHP_EOL;
    }

    $replace->replace($pathToContentXml, array('Mix' => 'Miximix'));

    $lines = $zip->zip('example', $pathToZipArchive);

    foreach ($lines as $line) {
        echo $line . PHP_EOL;
    }

    $lines = $convert->convert($pathToZipArchive . '.zip');

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
