<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-02
 */

class MyClass
{
}

$myClass = new MyClass();
$foo = null;
$bar = 'strint';
$foobar = 123;

echo 'my class is ' . (is_object($myClass) ? '' : 'not') . ' a class' . PHP_EOL;
echo 'foo is ' . (is_object($foo) ? '' : 'not') . ' a class' . PHP_EOL;
echo 'bar is ' . (is_object($bar) ? '' : 'not') . ' a class' . PHP_EOL;
echo 'foobar is ' . (is_object($foobar) ? '' : 'not') . ' a class' . PHP_EOL;
