<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

require_once __DIR__ . '/vendor/autoload.php';

$usage = 'usage: ' . __FILE__ . ' <path to fixtures>' . PHP_EOL;

if ($argc != 2) {
    echo $usage;
    exit(1);
}

$path = $argv[1];

$loader = new \Nelmio\Alice\Loader\Yaml();
$objects = $loader->load($path);

echo var_export($objects, true) . PHP_EOL;
