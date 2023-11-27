<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-09-08
 * @see https://stackoverflow.com/questions/5144583/getting-filename-or-deleting-file-using-file-handle/7690726#7690726
 */

$streamOrFilePointer = fopen(__FILE__, 'r');

$metaData = stream_get_meta_data($streamOrFilePointer);
echo var_export($metaData, true) . PHP_EOL;
