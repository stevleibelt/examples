<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-07-11 
 */

//replace multiple whitespaces with one
$line = '  asd s sad  asd asd asdasd sadasda sdsad asd';

echo 'line: ' . $line . PHP_EOL;
$line = preg_replace('/\s+/', ' ',$line);
echo 'line: ' . $line . PHP_EOL;
