<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-10-28
 * @description get public methods of class or object
 */

class MyClass
{
    public function bar() {}

    public function foo() {}

    protected function foobar() {}

    private function baz() {}
}


$myClass = new MyClass();

//echo $myClass must be an object
echo 'get_class_methods($myClass): ' . var_export(get_class_methods($myClass), true) . PHP_EOL;
echo 'get_class_methods(\'MyClass\'): ' . var_export(get_class_methods('MyClass'), true) . PHP_EOL;
