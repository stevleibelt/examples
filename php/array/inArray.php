<?php
/**
 * validate if $needle is in $array
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-28
 * @todo get it done - yoda says "research some has to be done"
 */

class MyDemoClass
{
    private $name;

    public function __construct($name)
    {
        $this->name = (string) $name;
    }

    public function __toString()
    {
        return $this->name; //to simple, but it is a democase
    }
}

$integerOne = 1;
$integerTwo = 2;
$objectOne = new MyDemoClass('demo_one');
$objectTwo = new MyDemoClass('demo_two');
$stringOne = 'foo';
$stringTwo = 'foobar';

$array = array(
    $integerOne,
    $objectOne,
    $stringOne
);

$expectedToBeInTheArray = array(
    $integerOne,
    $objectOne,
    $stringOne
);

$expectedToBeNotInTheArray = array(
    $integerTwo,
    $objectTwo,
    $stringTwo
);

foreach ($expectedToBeInTheArray as $value) {
    if (!in_array($value, $array)) {
        echo 'Test failed: It was expected that value: "' . var_export($value, true) . '" is in the array: "' . var_export($array, true) . '"' . PHP_EOL;
        exit(1);
    }
}

foreach ($expectedToBeNotInTheArray as $value) {
    if (in_array($value, $array)) {
        echo 'Test failed: It was expected that value: "' . var_export($value, true) . '" is not in the array: "' . var_export($array, true) . '"' . PHP_EOL;
        exit(1);
    }
}

echo 'Test passed.' . PHP_EOL;
echo 'Content of the array: "' . var_export($array, true) . '"' . PHP_EOL;
echo 'Following values are in the array: "' . var_export($expectedToBeInTheArray, true) . '"' . PHP_EOL;
echo 'Following values are not in the array: "' . var_export($expectedToBeNotInTheArray, true) . '"' . PHP_EOL;
