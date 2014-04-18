<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2011-02-21
 */

$content = 'This is a content line';
$filePath = '/tmp/bazzlineScriptsFOpen_' . getmypid();

$fh = fopen($filePath, 'w');

$numberOfBytesWritten = fwrite($fh, $content);
$filePointerPosition = ftell($fh);

fclose($fh);

echo '----------------' . PHP_EOL;
echo 'Opened file "' . $filePath . '"' . PHP_EOL;
echo 'Written content "' . $content . '"' . PHP_EOL;
echo 'Number of bytes written "' . $numberOfBytesWritten . '"' . PHP_EOL;
echo 'Current position of file handler "' . $filePointerPosition . '"' . PHP_EOL;
echo '----------------' . PHP_EOL;

unlink($filePath);
