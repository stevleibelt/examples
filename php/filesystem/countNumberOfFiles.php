<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-14
 */

//find number of *.php files in directory
$command = 'ls ' . __DIR__ . ' | grep .php$ | wc | awk \'{print $1}\'';
$numberOfFiles = array();
$return = null;
exec($command, $numberOfFiles, $return);

if ($return > 0) {
    throw new Exception(
        'following command created an error: "' . $command . '"' . PHP_EOL .
        'return: "' . $return . '"'
    );
}

echo var_export($numberOfFiles) . PHP_EOL;
