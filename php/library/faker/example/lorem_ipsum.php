<?php
/**
 * @param int [<length of text>]
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

require_once '../vendor/autoload.php';

$faker = \Faker\Factory::create();

$length = ($argc > 1) ? (int) $argv[1] : 123;

echo $faker->text($length) . PHP_EOL;
