<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10 
 */

require_once 'Command.php';
require_once 'ConvertOdtToPdfCommand.php';
require_once 'ZipCommand.php';

$archivePath = 'example';
$filePath = __DIR__ . '/../resources/example.odt';

$zip = new ZipCommand();
$convert = new ConvertOdtToPdfCommand();

mkdir($archivePath);
$lines = $zip->unzip($filePath, $archivePath);

foreach ($lines as $line) {
    echo $line . PHP_EOL;
}

$lines = $convert->convert($filePath);

foreach ($lines as $line) {
    echo $line . PHP_EOL;
}

$lines = $zip->zip('example', array($archivePath));

foreach ($lines as $line) {
    echo $line . PHP_EOL;
}
