<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-27 
 */

require_once 'Input.php';

$filePath = array_shift($argv);
$input = new Input(new String(), $argv);

echo 'number of arguments: ' . $input->getNumberOfArguments() . PHP_EOL;
echo 'parameters: ' . var_export($input->getParameters(), true) . PHP_EOL;
echo 'long options: ' . var_export($input->getLongOptions(), true) . PHP_EOL;
echo 'short options: ' . var_export($input->getShortOptions(), true) . PHP_EOL;
echo 'unhandled arguments: ' . var_export($input->getUnhandled(), true) . PHP_EOL;
echo PHP_EOL;
echo 'all arguments: ' . var_export($input->getArguments(), true) . PHP_EOL;
echo PHP_EOL;
echo PHP_EOL;
echo 'Usage: ' . PHP_EOL;
echo '    ' . basename(__FILE__) . ' --long-option -short-option key=value' . PHP_EOL;
