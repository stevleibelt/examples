<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-09-04
 * @todo implement benchmark
 * @see
 *  http://forums.anandtech.com/archive/index.php/t-45606.html
 *  http://php.net/manual/de/language.types.string.php
 */

$string = basename(__FILE__);
$length = strlen($string);
$positions = array();

for ($iterator = 0; $iterator < $length; ++$iterator) {
    $positions[] = $iterator;
}

echo 'string: ' . $string . PHP_EOL;

echo 'using curly braces' . PHP_EOL;
echo 'Strings may also be accessed using braces, as in $str{42}, for the same purpose. However, this syntax is deprecated as of PHP 6. Use square brackets instead.' . PHP_EOL;
foreach ($positions as $position) {
    echo 'character as position ' . $position . ' => ' . $string{$position} . PHP_EOL;
}

echo 'using array' . PHP_EOL;
foreach ($positions as $position) {
    echo 'character as position ' . $position . ' => ' . $string[$position] . PHP_EOL;
}

echo 'using substr' . PHP_EOL;
foreach ($positions as $position) {
    echo 'character as position ' . $position . ' => ' . substr($string, $position, 1) . PHP_EOL;
}
