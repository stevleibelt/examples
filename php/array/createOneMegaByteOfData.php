<?php
/**
* @author stev leibelt <artodeto@bazzline.net>
* @since 2014-07-23
*/

$anotherRound = true;
$data = array();
$initialMemoryUsage = memory_get_usage(true);
$iterator = 0;
$memoryUsageInMegaByteToGenerate = 1;

while ($anotherRound) {
    $data[] = $iterator;
    $currentMemoryUsage = (memory_get_usage(true) - $initialMemoryUsage);
    $currentMemoryUsageInMegaBytes = ($currentMemoryUsage / 1024 / 1024);
    if ($currentMemoryUsageInMegaBytes === $memoryUsageInMegaByteToGenerate) {
        $anotherRound = false;
    }
    ++$iterator;
}

echo 'done after ' . $iterator . ' steps' . PHP_EOL;
