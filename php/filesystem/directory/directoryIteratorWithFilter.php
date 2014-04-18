<?php
/**
 * Example by using a filter
 * 
 * @author artodeto
 * @since 2013-03-06
 */

$path = '.';

echo 'Iterating over current directory.' . PHP_EOL;
iteratePath($path);

$filename = 'myFile_' . time() . '_' . getmypid() . '.php';
echo 'Creating file "' . $filename . '"' . PHP_EOL;
echo 'Iterating over current directory.' . PHP_EOL;

touch($filename);
iteratePath($path);
unlink($filename);

function iteratePath($path)
{
    $directoryIterator = new Php5FileFilterIterator(
        new DirectoryIterator($path)
    );

    foreach ($directoryIterator as $iteratorItem) {
        echo PHP_EOL;
        echo 'basename: ' . $iteratorItem->getBasename() . PHP_EOL;
        echo 'filename: ' . $iteratorItem->getFilename() . PHP_EOL;
        echo 'last access time: ' . date('Y-m-d H:i:s', $iteratorItem->getATime()) . PHP_EOL;
        echo 'last change time: ' . date('Y-m-d H:i:s', $iteratorItem->getCTime()) . PHP_EOL;
        echo 'last modification time: ' . date('Y-m-d H:i:s', $iteratorItem->getMTime()) . PHP_EOL;
        echo 'owner ' . $iteratorItem->getOwner() . PHP_EOL;
        echo 'group ' . $iteratorItem->getGroup() . PHP_EOL;
        echo 'path ' . $iteratorItem->getPath() . PHP_EOL;
        echo 'pathname ' . $iteratorItem->getPathname() . PHP_EOL;
        echo 'size ' . $iteratorItem->getSize() . PHP_EOL;
    }
}

/**
 * @author artodeto
 * @return boolean
 * @since 2013-03-06
 */
class Php5FileFilterIterator extends FilterIterator
{
    /**
     * Accepts php5 extended files.
     * 
     * @author artodeto
     * @return boolean
     * @since 2013-03-06
     */
    public function accept()
    {
        return (preg_match('@\.(php5)$@i', $this->current()));
    }
}
