<?php

require_once __DIR__ . '/vendor/autoload.php';

createAndDisplayUserNames();
createAndDisplayUserNames('de_DE');
createAndDisplayUserNames('fr_FR');

function createAndDisplayUserNames($locale = 'en_EN', $numberOfUsers = 4)
{
    echo 'locale: ' . $locale . PHP_EOL;

    $faker = Faker\Factory::create($locale);

    for ($i = 0; $i < $numberOfUsers; ++$i) {
        echo $faker->name . PHP_EOL;
    }

    echo PHP_EOL;
}
