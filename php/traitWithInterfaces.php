<?php
/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2014-08-20
 */

trait FooTrait
{
    public function foo($string)
    {
        echo 'foo: ' . $string . PHP_EOL;
    }
}

interface FooInterface
{
    public function foo($string);
}

interface BarInterface
{
    public function bar($string);
}

class FooBar implements BarInterface, FooInterface
{
    use FooTrait;

    public function bar($string)
    {
        echo 'bar: ' . $string . PHP_EOL;
    }
}

$fooBar = new FooBar();
$fooBar->foo('foobar');
$fooBar->bar('foobar');

echo 'implements BarInterface: ' . (($fooBar instanceof BarInterface) ? 'yes' : 'no') . PHP_EOL;
echo 'implements FooInterface: ' . (($fooBar instanceof FooInterface) ? 'yes' : 'no') . PHP_EOL;
