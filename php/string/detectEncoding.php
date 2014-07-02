#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-02
 * @see:
 *  http://php.net/manual/en/function.mb-detect-encoding.php
 */

$string = 'áéóú';

echo 'string: "' . $string . '"' . PHP_EOL . 
    'has encoding: "' . detectEncoding($string) . '"' . PHP_EOL;

/**
 * @param string $content
 * @return string
 */
function detectEncoding($content)
{
    $detectionOrder = array(
        'ASCII',
        'UTF-8',
        'ISO-8859-1',
        'windows-1252',
        'iso-8859-15'
    );
    //set encoding detection order - first match will stop detection
    mb_detect_order($detectionOrder);
    $encoding = mb_detect_encoding($content);

    return $encoding;
}
