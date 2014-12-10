<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-09
 * @see
 *  http://stackoverflow.com/questions/19538535/how-to-use-zendpdf-pdf-in-zend-framework-2
 *  http://devzone.zend.com/1064/zend_pdf-tutorial/
 *  http://framework.zend.com/manual/1.12/en/zend.pdf.html
 */

require_once 'vendor/autoload.php';

$html = file_get_contents(__DIR__ . '/../resources/example.html');
$overwriteIfExists = true;

$pdf = \ZendPdf\PdfDocument::load(__DIR__ . '/../resources/example.pdf');

foreach ($pdf->pages as $page) {
    /** @var \ZendPdf\Page $page */
    $page->setFont(new \ZendPdf\Resource\Font\Simple\Standard\Courier(), 12);
    $page->drawText('fooo', 22, 46);
}

$pdf->save(__DIR__ . '/example.pdf', $overwriteIfExists);
