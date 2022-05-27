#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-13
 */

if ($argc != 2) {
    echo 'usage: ' . basename(__FILE__) . ' <runtime in seconds>' . PHP_EOL;
    exit(1);
}

$runTime = $argv[1];
$endTime = time() + $runTime;

class Circle
{
    private $status = 0;

    private $stats = array('|', '/', '-', '\\');

    public function initialize()
    {
        echo "\0337";   //save current cursor position
    }

    public function update()
    {
        echo "\0338" . '[' . $this->stats[$this->status] . '] ' . date('Y-m-d H:i:s');
        $this->status = ($this->status >= 3) ? 0 : ($this->status + 1);
    }
}

$circle = new Circle();
$circle->initialize();

while (time() <= $endTime) {
    $circle->update();
    //usleep(500000); //wait for half a second
    usleep(250000); //wait for quarter a second
}

echo PHP_EOL;
