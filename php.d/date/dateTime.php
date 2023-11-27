#!/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-20
 */

date_default_timezone_set('Europe/Berlin');

$dateTime = new DateTime('2014-04-20');

echo 'format(\'Y-md H:i:s\'): ' . $dateTime->format('Y-m-d H:i:s') . PHP_EOL;
echo 'format(\'U\'): ' . $dateTime->format('U') . PHP_EOL;
