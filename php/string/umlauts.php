<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-10
 * @see
 *  http://www.sebastianviereck.de/mysql-php-umlaute-sonderzeichen-utf8-iso/
 *  http://bueltge.de/wp-content/download/wk/utf-8_kodierungen.pdf
 *  http://www.semantic-mediawiki.org/wiki/Thread:Help_talk:CSV_format/Problems_with_umlaut
 */

$isCalledFromCommandLineInterface = (PHP_SAPI === 'cli');

if ($isCalledFromCommandLineInterface) {
    if (!isset($argv[1])) {
        echo 'Usage: ' . basename(__FILE__) . ' <string>' . PHP_EOL;
        return 1;
    } else {
        $string = $argv[1];
    }

    $newLine = PHP_EOL;
} else {
    if (!isset($_GET['string'])) {
        echo 'you have to provide the parameter "string"';
        exit();
    } else {
        $string = $_GET['string'];
    }

    $newLine = '<br />' . PHP_EOL;
}

$brokenToFixedUmlauts = array(
'Ã¼'=>'ü', 'Ã¤'=>'ä', 'Ã¶'=>'ö', 'Ã–'=>'Ö', 'ÃŸ'=>'ß', 'Ã '=>'à', 'Ã¡'=>'á', 'Ã¢'=>'â', 'Ã£'=>'ã', 'Ã¹'=>'ù', 'Ãº'=>'ú', 'Ã»'=>'û', 'Ã™'=>'Ù', 'Ãš'=>'Ú', 'Ã›'=>'Û', 'Ãœ'=>'Ü', 'Ã²'=>'ò', 'Ã³'=>'ó', 'Ã´'=>'ô', 'Ã¨'=>'è', 'Ã©'=>'é', 'Ãª'=>'ê', 'Ã«'=>'ë', 'Ã€'=>'À', 'Ã'=>'Á', 'Ã‚'=>'Â', 'Ãƒ'=>'Ã', 'Ã„'=>'Ä', 'Ã…'=>'Å', 'Ã‡'=>'Ç', 'Ãˆ'=>'È', 'Ã‰'=>'É', 'ÃŠ'=>'Ê', 'Ã‹'=>'Ë', 'ÃŒ'=>'Ì', 'Ã'=>'Í', 'ÃŽ'=>'Î', 'Ã'=>'Ï', 'Ã‘'=>'Ñ', 'Ã’'=>'Ò', 'Ã“'=>'Ó', 'Ã”'=>'Ô', 'Ã•'=>'Õ', 'Ã˜'=>'Ø', 'Ã¥'=>'å', 'Ã¦'=>'æ', 'Ã§'=>'ç', 'Ã¬'=>'ì', 'Ã­'=>'í', 'Ã®'=>'î', 'Ã¯'=>'ï', 'Ã°'=>'ð', 'Ã±'=>'ñ', 'Ãµ'=>'õ', 'Ã¸'=>'ø', 'Ã½'=>'ý', 'Ã¿'=>'ÿ', 'â‚¬'=>'€'
);

$search = array_keys($brokenToFixedUmlauts);
$replace = array_values($brokenToFixedUmlauts);

$fixedString = str_replace($search, $replace, $string);

echo 'fixed string:' . $newLine;
echo $fixedString . $newLine;
