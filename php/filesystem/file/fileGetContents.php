<?php
/**
 * Example what happens by using file_get_contents.
 * Creating an xml and an php file to read from.
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2013-05-26
 */

createFiles();
echoFileContents();
removeFiles();

function createFiles()
{
    $date = date('Ymd');

    $phpFileContent = <<<EOC
<?php
return array(
    'foo' => 'bar',
    'date' => '$date'
);
EOC;

    $xmlFileContent = <<<EOC
<?xml version="1.0" encoding="utf-8" ?>
<foo>bar</foo>
<date>$date</date>
EOC;

    file_put_contents('file_get_contents_example_file.php', $phpFileContent);
    file_put_contents('file_get_contents_example_file.xml', $xmlFileContent);
}

function removeFiles()
{
    unlink('file_get_contents_example_file.php');
    unlink('file_get_contents_example_file.xml');
}

function echoFileContents()
{
    $phpFileContent = file_get_contents('file_get_contents_example_file.php');
    $xmlFileContent = file_get_contents('file_get_contents_example_file.xml');

    echo 'php file content:' . PHP_EOL . 
        $phpFileContent . PHP_EOL;
    echo 'xml file content:' . PHP_EOL . 
        $xmlFileContent . PHP_EOL;
}
