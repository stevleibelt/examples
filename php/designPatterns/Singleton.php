<?php

class Singleton
{
    /** @var $this */
    private static $instance;

    /** @var string */
    private $string;

    private function __construct() {}

    /**
     * @return $this
     */
    final public static function getInstance()
    {
        if (is_null(self::$instance)) {
            $currentClassName = get_called_class();
            self::$instance = new $currentClassName();
        }

        return self::$instance;
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

//test
function displayObjectInformation($object, $prefix = '')
{
    echo $prefix . 'md5 hash from instance of class ' . get_class($object) . ' ' . md5(spl_object_hash($object)) . ' with string: ' . $object->getString() . PHP_EOL;
}

$classOne   = Singleton::getInstance();
$classTwo   = Singleton::getInstance();
$classThree = Singleton::getInstance();

$classOne->setString('class one');
$classTwo->setString('class two');

displayObjectInformation($classOne, 'class one: ');
displayObjectInformation($classTwo, 'class two: ');
displayObjectInformation($classThree, 'class three: ');
