#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-06-13
 */

if ($argc != 3) {
    echo 'called with invalid number of arguments' . PHP_EOL;
    echo basename(__FILE__) . ' <path to xml file> <path to output directory>';
}

$pathToXmlFile = $argv[1];
$pathToOutputDirectory = $argv[2];
$outputFileName = 'xmlFileNodesToArray_' . time() . '.php';

if ((!is_file($pathToXmlFile))
    || (!is_readable($pathToXmlFile))) {
    echo 'provided path to xml file is not a file or not readable' . PHP_EOL;
}

if ((!is_dir($pathToOutputDirectory))
    || (!is_writable($pathToOutputDirectory))) {
    echo 'provided output directory path is not a directory or not writable' . PHP_EOL;
}

$pathToFileName = $pathToOutputDirectory . DIRECTORY_SEPARATOR . $outputFileName;
$jsonEncodedXml = json_encode((array) simplexml_load_file($pathToXmlFile));
$jsonDecodedData = (array) json_decode($jsonEncodedXml);

$data = parseObjectToArray($jsonDecodedData);

function parseObjectToArray($data, $array = array()) {
    foreach ($data as $key => $value) {
        if (is_array($value)) {
            $array[$key] = parseObjectToArray($value);
        } else if (is_object($value)) {
            $array[$key] = parseObjectToArray((array) $value);
        } else {
            $array[$key] = null;
        }
    }

    return $array;
}

file_put_contents(
    $pathToFileName,
    var_export($data, true)
);