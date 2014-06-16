<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-06-16
 */

 namespace Foo\Bar;

//--------
//class definition
//--------
class FooBar
{
    /**
     * @return string
     */
    public function getName()
    {
        return __CLASS__;
    }
}

$fooBar = new FooBar();
echo 'namespaced class name: "' . $fooBar->getName() . '"' . PHP_EOL;
