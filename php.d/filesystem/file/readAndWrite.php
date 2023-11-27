<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2011-02-21
 */

$content = 'This is a content line';
$filePath = '/tmp/bazzlineScriptsFOpen_' . getmypid();

# write

$fh = fopen($filePath, 'w');

$numberOfBytesWritten = fwrite($fh, $content);
if ($numberOfBytesWritten === false) {
    exit('could not write content "' . $content . '" into file "' . $filePath . '"');
}
$filePointerPosition = ftell($fh);

fclose($fh);

echo '----------------' . PHP_EOL;
echo 'Opened file "' . $filePath . '"' . PHP_EOL;
echo 'Written content "' . $content . '"' . PHP_EOL;
echo 'Number of bytes written "' . $numberOfBytesWritten . '"' . PHP_EOL;
echo 'Current position of file handler "' . $filePointerPosition . '"' . PHP_EOL;
echo '----------------' . PHP_EOL;

echo PHP_EOL;

# read

$fh = fopen($filePath, 'r');

echo '----------------' . PHP_EOL;
echo 'outputting content of file "' . $filePath . '"' . PHP_EOL;
while (!feof($fh)) {
    $line = fgets($fh) . PHP_EOL;
    if (!feof($fh)) {
        echo $line . PHP_EOL;
    }
}
echo '----------------' . PHP_EOL;

fclose($fh);

unlink($filePath);
