#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-06-20
 */

class Example
{
    private $items = array(
        1,2,3,4,5,6,7,8,9,0
    );
    private $processExecution = true;

    public function execute()
    {
        declare(ticks = 10);

        pcntl_signal(SIGHUP,    array($this, 'signalHandler'));
        pcntl_signal(SIGINT,    array($this, 'signalHandler'));
        pcntl_signal(SIGUSR1,   array($this, 'signalHandler'));
        pcntl_signal(SIGUSR2,   array($this, 'signalHandler'));
        pcntl_signal(SIGQUIT,   array($this, 'signalHandler'));
        pcntl_signal(SIGILL,    array($this, 'signalHandler'));
        pcntl_signal(SIGABRT,   array($this, 'signalHandler'));
        pcntl_signal(SIGFPE,    array($this, 'signalHandler'));
        pcntl_signal(SIGSEGV,   array($this, 'signalHandler'));
        pcntl_signal(SIGPIPE,   array($this, 'signalHandler'));
        pcntl_signal(SIGALRM,   array($this, 'signalHandler'));
        pcntl_signal(SIGTERM,   array($this, 'signalHandler'));
        pcntl_signal(SIGCHLD,   array($this, 'signalHandler'));
        pcntl_signal(SIGCONT,   array($this, 'signalHandler'));
        pcntl_signal(SIGTSTP,   array($this, 'signalHandler'));
        pcntl_signal(SIGTTIN,   array($this, 'signalHandler'));
        pcntl_signal(SIGTTOU,   array($this, 'signalHandler'));
        //... add all you need
 
        shuffle($this->items);

        foreach ($this->items as $item) {
            if ($this->processExecution) {
                echo 'waiting for ' . $item . ' seconds' . PHP_EOL;
                sleep($item);
                pcntl_signal_dispatch();
            } else {
                break 1;
            }
        }   
    }   

    protected function signalHandler($signal)
    {   
        echo 'cought signal: "' . $signal . '"' . PHP_EOL;
        $this->processExecution = false;
    }
}

$example = new Example();
$example->execute();
