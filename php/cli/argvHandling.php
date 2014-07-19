#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-19
 * @see
 *  https://github.com/mpierzchalski/php-fork/blob/master/example/run.php
 */

$foo = null;
$v = null;

if (is_array($argv)) {
    foreach ($argv as $argument) {
        $data = array();
        preg_match('/^--(?P<parameter>([a-z]+))\=(?P<value>(.+))$/', $argument, $data);
        if (isset($data['parameter']) && isset($data['value'])) {
            switch ($data['parameter']) {
                case 'foo':
                    $foo = $data['value'];
                    break;
                case 'v':
                    $v = $data['value'];
                    break;
            }
        }
    }
}

if (is_null($foo) || is_null($v)) {
    echo 'Usage: ' . basename(__FILE__) . ' --foo=<foo> --v=<v>' . PHP_EOL;
} else {
    echo 'foo: ' . $foo . PHP_EOL;
    echo 'v: ' . $v . PHP_EOL;
}
