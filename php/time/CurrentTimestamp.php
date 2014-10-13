<?php
/**
 * If you try to do dependency injection whenever possible, ypu also want to
 * inject the current timestamp. Thats what this class is good for.
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-10-13
 */

class CurrentTimestamp
{
    /**
     * @return int
     */
    public function __invoke()
    {
        return time();
    }

    /**
     * @return int
     */
    public function __tostring()
    {
        return time();
    }
}

$currentTimestamp = new CurrentTimestamp();

echo 'current timestamp: ' . $currentTimestamp() . PHP_EOL;
