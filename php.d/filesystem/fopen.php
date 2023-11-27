<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-26
 */

$fileName   = basename(__FILE__) . '_temporary_file_' . date('Y_m_d-His');
$filePath   = DIRECTORY_SEPARATOR . 'tmp';
$processId  = getmypid();

echo $filePath . DIRECTORY_SEPARATOR . $fileName;

$fileHandler = fopen($filePath . DIRECTORY_SEPARATOR . $fileName, 'w+');

fwrite($fileHandler, $processId);

echo 'created file ' . $fileName . ' in ' . $filePath . PHP_EOL;
echo 'outputting content:' . PHP_EOL;
var_dump(file_get_contents($filePath . DIRECTORY_SEPARATOR . $fileName));

echo 'deleting file' . PHP_EOL;
unlink($filePath . DIRECTORY_SEPARATOR . $fileName);
