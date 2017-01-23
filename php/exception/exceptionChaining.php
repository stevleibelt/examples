<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-01-23
 */

try {
    try {
        throw new Exception(
            'line ' . __LINE__
        );
    } catch (Exception $exception) {
        throw new Exception(
            'line ' . __LINE__,
            0,
            $exception
        );
    }
} catch (Exception $exception) {
    echo ':: Exception trace as string' . PHP_EOL;
    echo var_dump($exception->getTraceAsString()) . PHP_EOL;
    echo PHP_EOL;
    echo ':: Exception handling with chaining' . PHP_EOL;
    do {
        echo '    file: ' . $exception->getFile() . PHP_EOL;
        echo '    line: ' . $exception->getLine() . PHP_EOL;
        echo '    message: ' . $exception->getMessage() . PHP_EOL;
        echo '    code: ' . $exception->getCode() . PHP_EOL;
        echo '    class: ' . get_class($exception) . PHP_EOL;
        echo PHP_EOL;
    } while ($exception = $exception->getPrevious());
}
