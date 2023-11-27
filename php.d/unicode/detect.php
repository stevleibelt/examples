#!/bin/php
<?php
/**
 * @access public
 * @param string $value
 * @return int
 * @see: 
 * http://stackoverflow.com/questions/2627788/how-do-i-best-remove-the-unicode-characters-that-xhtml-regards-as-non-valid-usin
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-16
 */
function detectInvalidXml($value)
{
    $current;
    if (empty($value)) 
    {
        return $ret;
    }
    $iterator = 0;

    $length = strlen($value);
    for ($i=0; $i < $length; ++$i) {
        $current = ord($value{$i});
        if (($current == 0x9) ||
            ($current == 0xA) ||
            ($current == 0xD) ||
            (($current >= 0x20) && ($current <= 0xD7FF)) ||
            (($current >= 0xE000) && ($current <= 0xFFFD)) ||
            (($current >= 0x10000) && ($current <= 0x10FFFF)))
        {
            ++$iterator;
        }
    }

    return $iterator;
}

$command = 'ls *.xml';
$lines = array();
exec($command, $lines);

foreach ($lines as $file) {
    $xml = file_get_contents($file);
    $numberOfInvalidCharacters = detectInvalidXml($xml);
    echo $file . PHP_EOL;
    echo $numberOfInvalidCharacters . PHP_EOL;
    echo PHP_EOL;
}
