<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-03-11
 */

$array = array();
for ($i=0; $i<=100; ++$i) {
  $array['key' . $i] = 'value' . $i;
}

$chunkSize = 4;
$numberOfArray = count($array);

$size = ceil($numberOfArray / $chunkSize);

$chunks = array_chunk($array, $size);

echo 'number of entries in array::' . $numberOfArray . PHP_EOL;
echo 'number of chunks by using a size of ' . $size . '::' . count($chunks) . PHP_EOL;
echo 'echo $chunks::' . PHP_EOL;
echo print_r($chunks, true) . PHP_EOL;
echo 'echo array_values::' . PHP_EOL;
echo print_r(array_values($chunks), true) . PHP_EOL;
