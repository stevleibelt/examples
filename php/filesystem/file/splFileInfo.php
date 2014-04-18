<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-12-14
 */

$filepath = __FILE__;
$path = dirname($filepath);
$name = basename($filepath);

$existingFile = new SplFileInfo($path . '/../file/' . $name); //just for demonstration purpose
$notExistingFile = new SplFileInfo(__FILE__ . 'foobar');

echo 'informations about an existing file' . PHP_EOL;
printFileInformation($existingFile);
echo PHP_EOL;
echo 'informations about a not existing file' . PHP_EOL;
printFileInformation($notExistingFile);

function printFileInformation(SplFileInfo $file)
{
    echo 'basename: ' . $file->getBasename() . PHP_EOL;
    echo 'filename: ' . $file->getFilename() . PHP_EOL;
    echo 'extension: ' . $file->getExtension() . PHP_EOL;
    echo 'pathname: ' . $file->getPathname() . PHP_EOL;
    echo 'path: ' . $file->getPath() . PHP_EOL;
}
