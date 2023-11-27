<?php
/**
 * @see http://php.net/manual/en/function.count-chars.php
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-25
 */

$string = ($argc > 1) ? $argv[1] : 'There is no foo without a bar';

$modes = array(
    0 => 'an array with the byte-value as key and the frequency of every byte as value.',
    1 => 'same as 0 but only byte-values with a frequency greater than zero are listed.',
    2 => 'same as 0 but only byte-values with a frequency equal to zero are listed.',
    3 => 'a string containing all unique characters is returned.',
    4 => 'a string containing all not used characters is returned.'
);
$mode = ($argc > 2) ? $argv[2] : 1;

echo 'string: "' . $string . '"' . PHP_EOL;
echo 'count_chars: ' . PHP_EOL . var_export(count_chars($string, $mode), true) . PHP_EOL;
