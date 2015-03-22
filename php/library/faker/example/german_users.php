<?php
/**
 * @param int [<number of users>]
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

require_once '../vendor/autoload.php';

$faker = \Faker\Factory::create('de_DE');

$numberOfUsers = ($argc > 1) ? (int) $argv[1] : 1;

for ($iterator = 0; $iterator < $numberOfUsers; ++$iterator) {
    echo 'city: ' . $faker->unique()->city . PHP_EOL;
    echo 'email: ' . $faker->unique()->email . PHP_EOL;
    echo 'name: ' . $faker->unique()->name . PHP_EOL;
    echo PHP_EOL;
}
