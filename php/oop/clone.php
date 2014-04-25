<?php
/**
 * @see http://www.php.net/manual/en/language.oop5.cloning.php
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-25
 */

class Foo
{
    public $content;
}

$foo = new Foo();
$foo->content = 'foo';

$bar = clone $foo;

echo 'content of foo: ' . $foo->content . PHP_EOL;
echo 'content of bar: ' . $bar->content . PHP_EOL;
