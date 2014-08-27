<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-27 
 */

require_once 'Input.php';

$input = new Input(new String(), $argv);

echo 'number of arguments: ' . $input->getNumberOfArguments() . PHP_EOL;
echo 'arguments: ' . var_export($input->getArguments(), true) . PHP_EOL;
echo PHP_EOL;
echo 'Usage: ' . PHP_EOL;
echo '    ' . basename(__FILE__) . ' --long-option -short-option key=value' . PHP_EOL;
