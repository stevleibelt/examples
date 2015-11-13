<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-11-13
 * @see
 *  http://php.net/manual/en/function.preg-match.php
 *  http://php.net/manual/en/function.preg-match.php#105924
 */

$patterns = array(
    'foo',
    'oo',
    'bar',
    'baz',
    '\*',
    '[\*\{}]',
    '[\*{\}]',
    '[*\{\}]',
    '[*{}]',
    '[\*\{\}\[\]]',
    '[\*\{\}]'
);

$strings = array(
    'foo',
    'foo*',
    'foobar',
    'foo{b,a}',
    'foo[b,a]'
);

foreach ($patterns as $pattern) {
    foreach ($strings as $string) {
        $matches = preg_match('/' . $pattern . '/', $string);

        echo 'string: ' . $string . ' does ' . (($matches === 0) ? 'not ' : '') . 'matches the pattern ' . $pattern . PHP_EOL;
    }
}
