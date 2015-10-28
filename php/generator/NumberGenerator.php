<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-10-23
 */

function NumberGenerator($start, $end)
{
    for ($iterator = $start; $iterator <= $end; ++$iterator) {
        yield $iterator;
    }
}

foreach (NumberGenerator(1, 4) as $number) {
    echo 'current number: ' . $number . PHP_EOL;
}
