<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09 
 */

require_once 'vendor/autoload.php';

$html = file_get_contents(__DIR__ . '/../resources/example.html');

$pdf = new PHPPdf\Core\Document(new PHPPdf\Core\Engine\ZF\Engine());
