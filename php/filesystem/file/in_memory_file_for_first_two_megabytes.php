<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-04-08
 * @see
 *    http://aaronbonner.io/post/840054542/using-memory-as-a-file-in-php-5-1
 *    http://php.net/manual/en/wrappers.php.php
 */

//if you want to know the file name, use tempnam instead

$handler = fopen('php://temp', 'wb+');

if ($handler === false) {
    echo 'could not create a temporary file' . PHP_EOL;
}
fwrite($handler, 'example content ' . __FILE__ . ' ' . __LINE__ . PHP_EOL);
fseek($handler, 0);
echo fread($handler, 1024);
fclose($handler);
