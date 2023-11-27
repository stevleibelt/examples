<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-01
 */

class MyParent
{
    private $property;

    public function __construct()
    {
        $this->property = __CLASS__;
    }

    public function __destruct()
    {
        unset($this->property);
    }

    public function execute()
    {
        echo $this->property . PHP_EOL;
        $child = new MyChild();
        $child->execute();
    }
}

class MyChild extends MyParent
{
    private $property;

    public function __construct()
    {
        parent::__construct();
        $this->property = __CLASS__;
    }

    public function __destruct()
    {
        parent::__destruct();
        unset($this->property);
    }

    public function execute()
    {
        echo $this->property . PHP_EOL;
    }
}


$example = new MyParent();
$example->execute();
