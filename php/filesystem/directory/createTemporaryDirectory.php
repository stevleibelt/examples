<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-14
 */

/** 
* @param string $methodName
* @return string
* @throws Exception
*/
function createTemporaryDirectory($name)
{   
    $hash = md5(__METHOD__ . $name);
    $root = sys_get_temp_dir();
    $path = $root . DIRECTORY_SEPARATOR . $hash;

    if (is_dir($path)) {
        if (rmdir($path) === false) {
            throw new Exception(
            'could not remove directory "' . $path . '"' 
            );  
        }   
    }   

    if (mkdir($path) === false) {
        throw new Exception(
        'could not create directory "' . $path . '"' 
        );  
    }   

    return $path;
} 

$path = createTemporaryDirectory(__FILE__);
echo 'path: ' . $path . PHP_EOL;
rmdir($path);
