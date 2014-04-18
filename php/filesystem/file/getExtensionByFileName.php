<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-11-13
 */

$fileName = 'a_notRegular.and-long_filename.extension';

$extension = array_pop(explode('.', $fileName));

echo 'file name: ' . $fileName . PHP_EOL;
echo 'extension: ' . $extension . PHP_EOL;
