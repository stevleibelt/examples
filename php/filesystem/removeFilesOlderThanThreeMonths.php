<?php

/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-15
 */

if ($argc < 2) {
    echo 'invalid number of arguments provided' . PHP_EOL;
    echo '    ' . basename(__FILE__) . ' <path to clean up>' . PHP_EOL;
    exit(1);
}

$lowestValidTimeStamp   = strtotime('-3 months');
$path                   = $argv[1];

echo 'cleaning up in path "' . $path . '"' . PHP_EOL;
echo 'removing files that are older than ' . date('Y-m-d H:i:s', $lowestValidTimeStamp) . PHP_EOL;

cleanUp($path, $lowestValidTimeStamp);

function cleanUp($path, $lowestValidFileChangeTime)
{
    $directoryIterator      = new DirectoryIterator($path);
    $numberOfItemsInTotal   = 0;
    $numberOfItemsRemoved   = 0;
    $scriptFileName         = basename(__FILE__);

    foreach ($directoryIterator as $iteratorItem) {
        $checkItem = ($iteratorItem->isFile()
            && ($iteratorItem->getFilename() !== $scriptFileName));

        if ($checkItem) {
            $removeFile = ($iteratorItem->getMTime() < $lowestValidFileChangeTime);


            if ($removeFile) {
                //because it is just a demo
                echo $iteratorItem->getPathname() . ' ' . date('Y-m-d H:i:s', $iteratorItem->getMTime()) . PHP_EOL;
                //unlink($iteratorItem->getPathname());
                ++$numberOfItemsRemoved;
            }
        }

        ++$numberOfItemsInTotal;
    }

    echo 'number of processed items: ' . $numberOfItemsInTotal . PHP_EOL;
    echo 'number of deleted items: ' . $numberOfItemsRemoved . PHP_EOL;
}

