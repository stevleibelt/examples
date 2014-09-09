<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2014-09-09
 */

class MyClass
{
    public function myFunction()
    {
        echo 'Method "myFunction" is called with ' . func_num_args() . ' number of arguments' . PHP_EOL;
        echo 'Arguments are: ' . var_export(func_get_args(), true) . PHP_EOL;
        echo PHP_EOL;
    }
}

$myClass = new MyClass();

$myClass->myFunction();
$myClass->myFunction(1);
$myClass->myFunction(1, 1.4, 'string');
$myClass->myFunction(array('foo', 'bar'), $myClass);
