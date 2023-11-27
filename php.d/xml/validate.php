<?php
/**
 * @author: stev leibelt <artodeto@bazzline.net>
 * @since: 2015-05-26
 * @see:
 *  http://php.net/manual/en/function.libxml-get-errors.php
 *  http://php.net/manual/en/libxml.constants.php
 *  http://php.net/manual/en/function.libxml-use-internal-errors.php
 *  http://php.net/manual/en/function.simplexml-load-file.php
 *  https://wiki.archlinux.org/index.php/Docbook
 */

//begin of validation
$arguments              = $argv;
$noXmlFilesAreProvided  = (count($arguments) < 2);
//end of validation

//begin of application
if ($noXmlFilesAreProvided) {
    $usage = 'Usage: ' . PHP_EOL .
        basename(__FILE__) . ' <foo.xml> [<bar.xml> [<...>]]' . PHP_EOL;

    echo $usage;
} else {
    foreach ($arguments as $path) {
        echo 'validating file: "' . $path . '"' . PHP_EOL;

        libxml_use_internal_errors(true);
        $data       = file_get_contents($path);
        $document   = simplexml_load_file($path);
        $xml        = explode(PHP_EOL, $data);

        if ($document === false) {
            $errors = libxml_get_errors();

            foreach ($errors as $error) {
                displayXmlError($error, $xml, true);
                echo PHP_EOL;
            }

            libxml_clear_errors();
        }

        echo PHP_EOL;
    }
}
//end of application

/**
 * @param LibXMLError $error
 * @param string $xml
 * @param bool $beVerbose
 * @return string
 */
function displayXmlError(LibXMLError $error, $xml, $beVerbose = false)
{
    $indention = "\t";

    if ($beVerbose) {
        $return  = $xml[$error->line - 1] . PHP_EOL;
        $return .= str_repeat('-', $error->column) . '^' . PHP_EOL;
    } else {
        $return = '';
    }

    switch ($error->level) {
        case LIBXML_ERR_WARNING:
            $return .= 'level: ' . $indention . $indention . 'warning' . PHP_EOL .
                'type: ' . $indention . $indention . $error->code . PHP_EOL;
            break;
        case LIBXML_ERR_ERROR:
            $return .= 'level: ' . $indention . $indention . 'error' . PHP_EOL .
                'type: ' . $indention . $indention . $error->code . PHP_EOL;
            break;
        case LIBXML_ERR_FATAL:
            $return .= 'level: ' . $indention . $indention . 'fatal error' . PHP_EOL .
                'type: ' . $indention . $indention . $error->code . PHP_EOL;
            break;
    }

    $return .= 'message: ' . $indention . trim($error->message) . PHP_EOL .
        'line: ' . $indention . $indention . $error->line . PHP_EOL .
        'column: ' . $indention . $error->column;

    echo $return . PHP_EOL;
}
