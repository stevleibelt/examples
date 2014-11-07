<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 204-11-07
 */

/**
 * @param int $return
 * @param string $command
 * @throws \RuntimeException
 */
function validateExecuteReturn($return, $command)
{
    if ($return > 0) {
        throw new RuntimeException(
            'following command created an error: "' . $command . '"' . PHP_EOL .
            'return: "' . $return . '"'
        );
    }
}

/**
 * @param string $command
 * @return array
 * @throws \RuntimeException
 */
function executeCommand($command)
{
    $lines = array();
    $return = null;

    exec($command, $lines, $return);
    validateExecuteReturn($return, $command);

    return $lines;
}

echo var_export(executeCommand('echo hello world'), true) . PHP_EOL;
