<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-02
 */

class MyClass
{
}


$myClass = new MyClass();

//echo $myClass must be an object
echo 'get_class($myClass): ' . get_class($myClass) . PHP_EOL;
