<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-30
 */

/**
 * @return string
 * @see http://stackoverflow.com/questions/5705082/is-serverserver-addr-safe-to-rely-on
 */
function getServerAddress()
{
    $address = '';

    if (isset($_SERVER['SERVER_ADDR'])) {
        $address = $_SERVER['SERVER_ADDR'];
    } else if (isset($_SERVER['LOCAL_ADDR'])) {
        $address = $_SERVER['LOCAL_ADDR'];
    } else if (isset($_SERVER['SERVER_NAME'])) {
        //dns lookup, expensive!
        $address = gethostbyname($_SERVER['SERVER_NAME']);
    } else {
        //cli mode
        if(stristr(PHP_OS, 'WIN')) {
            //dns lookup, expensive!
            return gethostbyname(php_uname("n"));
        } else {
            $ipForEth = shell_exec('/bin/ip a | /bin/grep eth');

            $matches = array();
            preg_match('/inet\ ([\d\.]+)/', $ipForEth, $matches);
            if (isset($matches[1])) {
                //found at least one match
                $address = $matches[1];
            }
        }
    }

    return $address;
}

echo getServerAddress() . PHP_EOL;
