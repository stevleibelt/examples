<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-11-13
 */

$fileNames = array(
    basename(__FILE__),
    '*.php',
    'file*',
    'foo'
);

$path = __DIR__ . DIRECTORY_SEPARATOR;

echo 'root path: ' . __DIR__ . PHP_EOL;

foreach ($fileNames as $fileName) {
    $filePath = $path . $fileName;
    echo 'file path: ' . $filePath . PHP_EOL;

    foreach (glob($filePath) as $pathName) {
        if (is_file($pathName)) {
            echo '    ' . basename($pathName) . PHP_EOL;
        }
    }
}
