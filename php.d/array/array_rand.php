<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09
 */

$array = array();
for ($i=0; $i<=100; ++$i) {
  $array['key' . $i] = 'value' . $i;
}

$numberOfRandomSelectedEntries = 6;
$sizeOfTheArray = count($array);

$randomSelectedKeys = array_rand($array, $numberOfRandomSelectedEntries);

echo 'random selected keys: ' . var_export($randomSelectedKeys, true) . PHP_EOL;
echo 'values:' . PHP_EOL;
foreach ($randomSelectedKeys as $key) {
    echo $array[$key] . PHP_EOL;
}
