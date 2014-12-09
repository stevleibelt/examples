<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09 
 */

require_once 'vendor/autoload.php';

define('DOMPDF_ENABLE_AUTOLOAD', false);
require_once 'vendor/dompdf/dompdf/dompdf_config.inc.php';

$html = file_get_contents(__DIR__ . '/../resources/example.html');

$pdf = new DOMPDF();

$pdf->load_html($html);
$pdf->set_paper('A4', 'portrait');
$pdf->render();

file_put_contents(__DIR__ . '/example.pdf', $pdf->output(array('compress' => 0)));

