<?php
/**
* Example for directory iterator
* http://www.php.net/manual/en/class.directoryiterator.php
*
* @author artodeto
* @since 2013-03-06
*/

$directoryIterator = new DirectoryIterator('../');
$countedNumberOfEntries = 0;

foreach ($directoryIterator as $iteratorItem) {
  echo PHP_EOL;
  echo 'basename: ' . $iteratorItem->getBasename() . PHP_EOL;
  echo 'filename: ' . $iteratorItem->getFilename() . PHP_EOL;
  echo 'last access time: ' . date('Y-m-d H:i:s', $iteratorItem->getATime()) . PHP_EOL;
  echo 'last change time: ' . date('Y-m-d H:i:s', $iteratorItem->getCTime()) . PHP_EOL;
  echo 'last modification time: ' . date('Y-m-d H:i:s', $iteratorItem->getMTime()) . PHP_EOL;
  echo 'is diretory: ' . var_export($iteratorItem->isDir(), true) . PHP_EOL;
  echo 'is file: ' . var_export($iteratorItem->isFile() , true). PHP_EOL;
  echo 'is link: ' . var_export($iteratorItem->isLink() , true). PHP_EOL;
  echo 'is dot (.): ' . var_export($iteratorItem->isDot() , true). PHP_EOL;

  $countedNumberOfEntries++;
}

echo PHP_EOL;
echo 'available methods of item \'' . get_class($iteratorItem) . '\'' . PHP_EOL;
echo var_export(get_class_methods(get_class($iteratorItem)), true) . PHP_EOL;

echo PHP_EOL;
echo 'Number of items: ' . count($directoryIterator) . PHP_EOL;
echo 'Counted number of items: ' . $countedNumberOfEntries . PHP_EOL;

echo PHP_EOL;
echo 'RecursiveDirectoryIterator available since php 5.3 with spl support compiled into' . PHP_EOL;

echo PHP_EOL;
echo 'available methods in \'DirectoryIterator\'' . PHP_EOL;
echo var_export(get_class_methods('DirectoryIterator'), true) . PHP_EOL;
echo PHP_EOL;
