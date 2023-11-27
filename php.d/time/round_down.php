<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-11-02
 * @see: http://stackoverflow.com/questions/2480637/round-minute-down-to-nearest-quarter-hour
 */

$timestamp  = time();
$hour       = date('H', $timestamp);
$minutes    = date('i', $timestamp);

echo $minutes . PHP_EOL;

$rounded = ($minutes - ($minutes % 15));

echo $rounded . PHP_EOL;
