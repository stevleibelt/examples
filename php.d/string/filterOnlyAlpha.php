<?php
/**
 * handles special characters the german way
 * 
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-12
 */

/**
 * @param string $string
 * @return string
 */
function filterOnlyAlpha($string)
{
    $umlauts = array(
        'ä' => 'ae',
        'Ä' => 'Ae',
        'ü' => 'ue',
        'Ü' => 'Ue',
        'ö' => 'oe',
        'Ö' => 'Oe',
        'ß' => 'sz',
        ' ' => '_'
    );
    $string = str_replace(array_keys($umlauts), array_values($umlauts), $string);

    return preg_replace('/[^a-zA-Z]/', '', $string);
}


$string = 'öPasé_asödk aösdkpwel3';

echo 'original string: "' . $string . '"' . PHP_EOL;
echo 'filtered string: "' . filterOnlyAlpha($string) . '"' . PHP_EOL;
