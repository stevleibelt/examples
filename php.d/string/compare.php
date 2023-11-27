<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-02-03
 */

/**
 * @param string $string
 * @return string
 */
function normalize($string)
{
    $decoded                = html_entity_decode($string, ENT_NOQUOTES, 'UTF-8');
    $lowered                = strtolower($decoded);
    $noXmlTags              = preg_replace ('/<[^>]*>/', ' ', $lowered); 
    $noControlCharacters    = str_replace(array("\r\n", "\r", "\t"), ' ', $lowered);
    $onlyValidCharacters    = preg_replace('/[^a-z\-0-9\(\)\|]/i', '', $noControlCharacters);
    $trimmed                = trim($onlyValidCharacters, ",.");
    $noSpaces               = preg_replace('/\ {1,}/', '', $trimmed);

    return $noSpaces;
}


/**
 * @param string $string
 * @param string $search
 * @return boolean
 **/
function contains($string, $search)
{
    if (strlen($search) == 0) {
        $contains = false;
    } else {
        $contains = !(strpos($string, $search) === false);
    }

    return $contains;
}

$strings = array(
    'foo <bar>bar</bar>' => 'foo bar'
);


foreach ($strings as $string => $search) {
    echo 'string: "' . $string . '"' . PHP_EOL;
    echo (contains(normalize($string), normalize($search)) ? 'contains' : 'does not contains') . PHP_EOL;
    echo 'search: "' . $search . '"' . PHP_EOL;
    echo PHP_EOL;
}
