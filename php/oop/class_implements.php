<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-23
 */

//--------
//class and interface definition
//--------
class FooBar extends stdClass implements Foo, Bar
{
    public function foo()
    {
        return 'foo';
    }

    public function bar()
    {
        return 'bar';
    }
}

interface Foo
{
    public function foo();
}

interface Bar
{
    public function bar();
}

//if you have an object, simple use "instanceof"
echo var_export(class_implements('FooBar')) . PHP_EOL;
