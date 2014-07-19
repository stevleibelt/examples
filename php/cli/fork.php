#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-07-19
 * @see
 *  https://en.wikipedia.org/wiki/Fork_(operating_system)
 *  http://www.yolinux.com/TUTORIALS/ForkExecProcesses.html
 *  http://www.electrictoolbox.com/article/php/process-forking/
 *  http://php.net/manual/en/function.pcntl-fork.php
 *  https://github.com/mitallast/php-fork
 *  https://github.com/jimbojsb/workman
 *  https://github.com/robbmj/PHP-Fork/blob/master/forktest1.php
 *  https://github.com/mpierzchalski/php-fork
 *  https://github.com/pear/PHP_Fork
 *  https://github.com/pbergman/processes-fork
 *  https://github.com/kakawait/forki
 *  https://github.com/johan-adriaans/PHP-Semaphore-Fork-test
 *  https://github.com/duncan3dc/fork-helper
 *  https://github.com/mmarquez/php-thread
 *  https://github.com/barracudanetworks/forkdaemon-php
 */

/**
 * class Forker
 */
class Forker
{
    /**
     * @var array
     */
    private $processIds = array();

    /**
     * @param callable $callable
     * @return int
     * @throws RuntimeException
     */
    public function fork(callable $callable)
    {
        $processId = pcntl_fork();

        if ($processId < 0) {
            throw new RuntimeException(
                'failed to fork'
            );
        } else if ($processId === 0) {
            //echo 'child process: start execution' . PHP_EOL;
            $callable();
            exit(0);
        } else if ($processId > 0) {
            //echo 'parent process (' . posix_getpid . '): started child process (' . $processId . ')' . PHP_EOL;
            $this->processIds[$processId] = microtime(true);
            //uncomment this and only one child will be created
            //exit(0);
        }

        //code executed by parent and child
        //echo 'process id (' . $processId . ')' . PHP_EOL;

        return $processId;
    }

    /**
     * @throws RuntimeException
     */
    public function wait()
    {
        foreach ($this->processIds as $processId => $startTime) {
            pcntl_waitpid($processId, $status, WUNTRACED);
            if ($status > 0) {
                throw new RuntimeException(
                    'child process (' . $processId . ') returned code ' . $status
                );
            }

            unset($this->processIds[$processId]);
        }
    }
}

$forker = new Forker();
$iterator = 0;
$processIds = array();
$totalNumberOfForks = 7;

echo '----------------' . PHP_EOL;
echo 'parent (' . posix_getpid() . ') started' . PHP_EOL;
echo 'start demonstration by forking ' . $totalNumberOfForks . ' processes' . PHP_EOL;
echo '----------------' . PHP_EOL;

while ($iterator < $totalNumberOfForks) {
    $processIds[] = $forker->fork(
        function () {
            $seconds = rand(4, 10);
            echo '    child (' . posix_getpid() . ') started' . PHP_EOL;
            echo '    child (' . posix_getpid() . ') will sleep for ' . $seconds . ' seconds' . PHP_EOL;
            sleep($seconds);
            echo '    child (' . posix_getpid() . ') stopped' . PHP_EOL;
        }
    );
    ++$iterator;
}

sleep (1);
echo '----------------' . PHP_EOL;
echo 'forked childs with process ids ' . implode(', ', $processIds) . PHP_EOL;
echo '----------------' . PHP_EOL;

$forker->wait();

echo '----------------' . PHP_EOL;
echo 'done' . PHP_EOL;
echo '----------------' . PHP_EOL;
