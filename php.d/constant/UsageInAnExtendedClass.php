<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-07
 */

require_once __DIR__ . '/Foo.php';
require_once __DIR__ . '/Foobar.php';

function dump(Foo $foo) 
{
    echo get_class($foo) . PHP_EOL;
    echo 'dump: ' . $foo->dump() . PHP_EOL;
}

$foo    = new Foo();
$foobar = new Foobar();

dump($foo);
dump($foobar);
