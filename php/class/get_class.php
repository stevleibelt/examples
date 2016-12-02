<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-02
 */

namespace De\Leibelt\Stev\Example\Php\Classes;

class MyClass
{
}


$myClass = new MyClass();

//echo $myClass must be an object
echo ':: Outputting ful qualified class name.' . PHP_EOL;
echo get_class($myClass) . PHP_EOL;
echo PHP_EOL;

echo ':: Outputting the class name.' . PHP_EOL;
echo basename(str_replace('\\', '/', get_class($myClass))) . PHP_EOL;
