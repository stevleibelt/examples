<?php

/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-01-18
 */

echo 'prefixed with "foo:"' . PHP_EOL;
echo tempnam(__DIR__, 'foo_') . PHP_EOL;
