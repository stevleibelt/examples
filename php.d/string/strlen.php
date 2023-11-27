<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-03
 */

$array = array(
  //null
  null,
  //boolean
  true, false,
  //numeric
  0, 1, 11, 1.2,
  //string
  '', 'a', 'asd213', 'asd adasdsd'
);

foreach ($array as $value) {
    echo var_export($value, true) . PHP_EOL;
    echo 'strlen: ' . strlen($value) . PHP_EOL;
}
