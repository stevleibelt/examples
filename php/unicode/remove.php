#!/bin/php
<?php
/**
 * Removes invalid XML
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-01-15
 * @access public
 * @param string $value
 * @return string
 * @see: 
 * http://stackoverflow.com/questions/2627788/how-do-i-best-remove-the-unicode-characters-that-xhtml-regards-as-non-valid-usin
 */
function stripInvalidXml($value)
{
    $return = "";
    $current;

    if (!empty($value)) {
        $length = strlen($value);
        for ($iterator = 0; $iterator < $length; ++$iterator) {
            //http://php.net/manual/en/function.ord.php
            $current = ord($value{$iterator});

            if (($current == 0x9) ||
                ($current == 0xA) ||
                ($current == 0xD) ||
                (($current >= 0x20) && ($current <= 0xD7FF)) ||
                (($current >= 0xE000) && ($current <= 0xFFFD)) ||
                (($current >= 0x10000) && ($current <= 0x10FFFF))) {
                //http://php.net/manual/en/function.chr.php
                $return .= chr($current);
            }  else {
                $return .= ' ';
            }
        }
    }

    return $return;
}


$command = 'ls *.xml';
$lines = array();
exec($command, $lines);

foreach ($lines as $file) {
    $xml = file_get_contents($file);
    $cleaned = stripInvalidXml($xml);
    file_put_contents($file . '.cleaned', $cleaned);
}
