<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-11
 */

$modes = array('a', 's', 'n', 'r', 'v', 'm');

foreach ($modes as $mode) {
    echo 'php_uname(\'' . $mode . '\')' . PHP_EOL;
    echo php_uname($mode) . PHP_EOL . PHP_EOL;
}
