<?php
/**
 * @param float [<percentage of probability>]
 * @param string [<default text>]
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

require_once '../vendor/autoload.php';

$faker = \Faker\Factory::create();

$default = ($argc > 2) ? (string) $argv[2] : 'no text';
$length = 123;
$probability = ($argc > 1) ? (float) $argv[1] : 0.5;

//without default
//echo $faker->optional($probability)->text . PHP_EOL;
//with default
echo $faker->optional($probability, $default)->text . PHP_EOL;
