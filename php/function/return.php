<?php
/**
* @author stev leibelt <artodeto@bazzline.net>
* @since 2015-03-05
*/

//start of function declaration
function returnVoid()
{
    return;
}

function returnNull()
{
    return null;
}

function returnBoolean()
{
    return (bool) null;
}

function returnInt()
{
    return (int) null;
}

function returnFloat()
{
    return (float) null;
}

function returnString()
{
    return (string) null;
}

function returnObject()
{
    return new stdClass();
}
//end of function declaration

$functions = array(
    'returnVoid',
    'returnNull',
    'returnBoolean',
    'returnInt',
    'returnFloat',
    'returnString',
    'returnObject'
);

//output
foreach ($functions as $function) {
    echo $function . PHP_EOL;
    echo var_export($function(), true) . PHP_EOL;
    echo '----------------' . PHP_EOL;
}
