<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09 
 */

require_once 'vendor/autoload.php';

$html = file_get_contents(__DIR__ . '/../resources/example.html');

$array = array(
    '##MULTI_LINE_CONTENT##'    => 'line one' . '<br />' . 'line two' . '<br />' . 'line three',
    '##SINGLE_LINE_CONTENT##'   => '<strong>single</strong> <i>line</i>',
    '##FIRST_CHECKBOX##'        => ' ',
    '##SECOND_CHECKBOX##'       => 'X',
    '##THIRD_CHECKBOX##'        => ' ',
    '##FOURTH_CHECKBOX##'       => 'x',
    '##NAME##'                  => '<i>Max Power</i>',
    '##CURRENT_PAGE_NUMBER##'   => 1,
    '##TOTAL_NUMBER_OF_PAGES##' => 1,
    '##IMAGE_LEIBELT##'         => '<img src="' . __DIR__ . '/../resources/leibelt.png' . '" />',
    '##IMAGE_SMILIE##'          => '<img src="' . __DIR__ . '/../resources/smilie.png' . '" />'
);

foreach ($array as $key => $value) {
    $html = str_replace($key, $value, $html);
}

//$pdf = new \Knp\Snappy\Pdf(__DIR__ . '/vendor/h4cc/wkhtmltopdf-amd64/bin/wkhtmltopdf-amd64');
$pdf = new \Knp\Snappy\Pdf('/usr/bin/wkhtmltopdf');

$outputFilePath = __DIR__ . '/example.pdf';

//file_put_contents($outputFilePath, $pdf->getOutput('https://github.com/KnpLabs/snappy'));

$pdf->generateFromHtml(
    $html,
    $outputFilePath,
    array(),
    true
);
