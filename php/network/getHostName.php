<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-30
 */


if (stristr(PHP_OS, 'WIN')) {
    echo 'not supported' . PHP_EOL;
} else {
    $hostName = file_get_contents('/etc/hostname');
    echo trim($hostName) . PHP_EOL;
}
