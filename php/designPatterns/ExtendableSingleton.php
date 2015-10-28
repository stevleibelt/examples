<?php

class Singleton
{
    /** @var array $this[] */
    private static $instances;

    /** @var string */
    private $string;

    private function __construct() {}

    /**
     * @return $this
     */
    final public static function getInstance()
    {
        $currentClassName = get_called_class();
        $isCurrentClassNameNotAvailableInInstancePool = (!isset(self::$instances[$currentClassName]));
        //if (!self::$instance instanceof self) {
        //if (!self::$instance instanceof $currentClassName) {
        //if (is_null(self::$instance)) {
        if ($isCurrentClassNameNotAvailableInInstancePool) {
            //needed for late static binding: 
            //http://php.net/manual/en/function.get-called-class.php
            self::$instances[$currentClassName] = new $currentClassName();
            /*
        } else {
            $originalClassName = get_class(self::$instance);
            $isNotTheSameClassNameInstanceRequested = ($currentClassName !== $originalClassName);
            if ($isNotTheSameClassNameInstanceRequested) {
                self::$instance = new $currentClassName();
            }
             */
        }

        return self::$instances[$currentClassName];
    }

    public function getString()
    {
        return $this->string;
    }

    /**
     * @param string
     */
    public function setString($string)
    {
        $this->string = (string) $string;
    }
}

class ExtendedSingleton extends Singleton 
{
    public function displayClassName()
    {
        echo get_class($this) . PHP_EOL;
    }
}

//test
function displayObjectInformation($object, $prefix = '')
{
    echo $prefix . 'md5 hash from instance of class ' . get_class($object) . ' ' . md5(spl_object_hash($object)) . ' with string: ' . $object->getString() . PHP_EOL;
}

$classOne   = Singleton::getInstance();
$classTwo   = Singleton::getInstance();
$classThree = ExtendedSingleton::getInstance();
$classFour  = ExtendedSingleton::getInstance();
$classFive  = Singleton::getInstance();

$classOne->setString('class one');
$classTwo->setString('class two');
$classThree->setString('class three');

displayObjectInformation($classOne, 'class one: ');
displayObjectInformation($classTwo, 'class two: ');
displayObjectInformation($classThree, 'class three: ');
displayObjectInformation($classFour, 'class four: ');
displayObjectInformation($classFive, 'class five: ');

$classThree->displayClassName();
