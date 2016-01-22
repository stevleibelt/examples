<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-21
 */

class MyClass {}

class MyOtherClass extends MyClass
{
    public $foo = array();
}

$myClass        = new MyClass();
$myOtherClass   = new MyOtherClass();

$myOtherClass->foo = array('foo', 'bar');

$thingsToCount = array(
    'myClass'           => $myClass,
    'myOtherClass'      => $myOtherClass,
    'null'              => null,
    'empty array'       => array(),
    'filled array'      => array('foo', 'bar'),
    '0'                 => 0,
    '3'                 => 3,
    'empty string'      => '',
    'not empty string'  => 'foobar'
);

foreach ($thingsToCount as $identifier => $thing) {
    echo 'counting ' . $identifier . PHP_EOL;
    echo count($thing) . PHP_EOL;
}
