<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-04-08
 * @see
 *    http://php.net/manual/en/function.tmpfile.php
 *    http://php.net/manual/en/resource.php
 *    http://php.net/manual/en/function.tempnam.php
 */

//if you want to know the file name, use tempnam instead
$temporary = tmpfile();

if ($temporary === false) {
    echo 'could not create a temporary file' . PHP_EOL;
}
fwrite($temporary, 'example content ' . __FILE__ . ' ' . __LINE__ . PHP_EOL);
fseek($temporary, 0);
echo fread($temporary, 1024);
//fclose removes the file automatically when fclose is called
fclose($temporary);
