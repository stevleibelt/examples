<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-07-29
 */

$wait = (isset($_GET['wait']))
        ? (int) $_GET['wait']
                : 3;

$start  = date('Y-m-d H:i:s');
sleep($wait);
$end    = date('Y-m-d H:i:s');

echo var_export(
    array(
        'start'         => $start,
        'end'           => $end,
        'powered by'    => 'bazzline.net'
    ),
    true
) . PHP_EOL;
