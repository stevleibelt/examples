<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-12-14
 */

$iterator = new GlobIterator(__DIR__ . '/../*');

foreach ($iterator as $item) {
    echo $item->getFilename() . PHP_EOL;
}

echo PHP_EOL;
echo 'class' . PHP_EOL;
echo get_class($item) . PHP_EOL;
echo 'available methods' . PHP_EOL;
echo var_export(get_class_methods(get_class($item)), true) . PHP_EOL;
