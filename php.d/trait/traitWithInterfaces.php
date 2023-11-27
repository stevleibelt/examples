<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-20
 */

interface FooInterface
{
    public function foo($string);
}

interface BarInterface
{
    public function bar($string);
}

trait FooTrait
{
    public function foo($string)
    {
        echo 'foo: ' . $string . PHP_EOL;
    }
}

trait BazTrait
{
    public function baz($string)
    {
        echo 'baz: ' . $string . PHP_EOL;
    }
}

abstract class FooBarClass implements BarInterface, FooInterface
{
    use FooTrait;

    abstract public function baz($string);

    public function bar($string)
    {
        echo 'bar: ' . $string . PHP_EOL;
    }
}

class BazClass extends FooBarClass
{
    use BazTrait;
}

$baz = new BazClass();
$baz->foo('foobar');
$baz->bar('foobar');
$baz->baz('foobar');

echo 'implements BarInterface: ' . (($baz instanceof BarInterface) ? 'yes' : 'no') . PHP_EOL;
echo 'implements FooInterface: ' . (($baz instanceof FooInterface) ? 'yes' : 'no') . PHP_EOL;
