# php pdf generator components

## [tcpdf](https://github.com/stevleibelt/examples/tree/master/php/pdf/tcpdf)

### general

    TCPDF is a PHP class for generating PDF files on-the-fly without requiring external extensions.

* [homepage](http://www.tcpdf.org/)
* [examples](http://www.tcpdf.org/examples.php)
* [packagist](http://packagist.org/packages/tecnick.com/tcpdf)
* [github](https://github.com/tecnickcom/TCPDF)
* [LGPL 3 license](http://www.tcpdf.org/license.php)

### my two cents

* not getting it running
* one big monster file
* strange parameter names
* to much for simple and quick usage
* can work with html as template
* can not work with pdf as template

## [dompdf](https://github.com/stevleibelt/examples/tree/master/php/pdf/dompdf)

### general

    dompdf is an HTML to PDF converter. 

* [homepage](http://pxd.me/dompdf/www/)
* [examples](http://pxd.me/dompdf/www/examples.php)
* [github](https://github.com/dompdf/dompdf)
* [packagist](http://packagist.org/packages/dompdf/dompdf)
* [wiki](https://github.com/dompdf/dompdf/wiki/Usage)
* [LGPL 2.1 license](https://github.com/dompdf/dompdf/blob/master/LICENSE.LGPL)

### my two cents

* dompdf.php is the main "doc"
* provided examples are not that kind of examples I would like
* can work with html as template
* can not work with pdf as template

## mpdf

### general

    A PHP class to generate PDF files from HTML with Unicode/UTF-8 and CJK support

* [homepage](http://www.mpdf1.com/mpdf/)
* [examples]http://www.mpdf1.com/mpdf/index.php?page=Examples)
* [github](https://github.com/finwe/mpdf)
* [packagist](http://packagist.org/packages/mpdf/mpdf)
* [GPL 1+ license](https://github.com/finwe/mpdf/blob/master/LICENSE.txt)

## [zendpdf](https://github.com/stevleibelt/examples/tree/master/php/pdf/zendpdf)

### general

    Zend Pdf Component

* [homepage](http://packages.zendframework.com/)
* [github](https://github.com/zendframework/ZendPdf.git)
* [packagist](http://packagist.org/packages/zendframework/zendpdf)
* [BSD 3 Clause license](https://github.com/zendframework/ZendPdf/blob/master/LICENSE.txt)

### my two cents

* no documentation
* can work with pdf as template
* can not work with html as template

## knp-snappy

### general

    PHP5 library allowing thumbnail, snapshot or PDF generation from a url or a html page.

* [github](http://github.com/KnpLabs/snappy)
* [packagist](http://packagist.org/packages/knplabs/knp-snappy)
* [MIT license](https://github.com/KnpLabs/snappy/blob/master/LICENSE)

### my two cents

* easy to use
* runs good
* library via composer is not working, only local installation

## [php-pdf](https://github.com/stevleibelt/examples/tree/master/php/pdf/php-pdf)

### general

    Pdf and graphic files generator library for PHP.

* [github](https://github.com/psliwa/PHPPdf.git)
* [packagist](http://packagist.org/packages/psliwa/php-pdf)
* [examples](https://github.com/psliwa/PHPPdf/tree/master/examples)

### my two cents

* no documentation

## other ideas

* use sofflice --headless --convert-to pdf my.odf
    * odt is a zip container
    * you can manipulate the content.xml and compress this folder to an odt
    * [images in odt](http://orgmode.org/manual/Images-in-ODT-export.html)
* take a look on [PHPWord](https://github.com/PHPOffice/PHPWord)