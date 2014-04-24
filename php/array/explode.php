<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-04-24
 */

$strings = array(
    'empty' => '',
    'single' => 'asd',
    'single with separator as prefix' => ',asd',
    'single with separator as suffix' => 'asd,',
    'single with separator as prefix and suffix' => ',asd,',
    'multiple' => 'asd,qwe',
    'multiple with separator as prefix' => ',asd,qwe',
    'multiple with separator as suffix' => 'asd,qwe,',
    'multiple with separator as prefix and suffix' => ',asd,qew,'
);


foreach ($strings as $description =>  $string) {
    echo 'string (' . $description . '): "' . $string . '"' . PHP_EOL;
    echo var_export(explode(',', $string), true) . PHP_EOL;
}
