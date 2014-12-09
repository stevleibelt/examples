<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09 
 */

require_once 'vendor/autoload.php';

$encoding       = 'UTF-8';
$format         = 'A4';
$isUnicode      = true;
$orientation    = 'P';
$unit           = 'mm';
$useDiskCache   = true;
$isPdfA         = false;

$html = file_get_contents(__DIR__ . '/../resources/example.html');

$pdf = new TCPDF($orientation, $unit, $format, $isUnicode, $encoding, $useDiskCache, $isPdfA);

$pdf->SetAuthor('Stev Leibelt');
$pdf->SetCreator('TCPDF');
$pdf->SetTitle('example ' . date('Y-m-d'));
$pdf->SetSubject('TCPDF usage');
$pdf->SetKeywords('php, pdf, tcpdf');

$pdf->SetMargins(15, 20, 15);
$pdf->SetHeaderMargin(5);
$pdf->SetFooterMargin(10);

$pdf->SetAutoPageBreak(true);
$pdf->setFontSubsetting(true);
$pdf->AddPage();

$pdf->writeHTML($html);
$pdf->Output(__DIR__ . '/example.pdf');