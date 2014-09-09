<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2014-09-09
 * @see
 *  http://php.net/manual/en/language.types.callable.php
 *  http://php.net/manual/en/function.call-user-func.php
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

call_user_func(array($myClass, 'myFunction'));
call_user_func(array($myClass, 'myFunction'), 1);
call_user_func(array($myClass, 'myFunction'), 1, 1.4, 'string');
call_user_func(array($myClass, 'myFunction'), array('foo', 'bar'), $myClass);
