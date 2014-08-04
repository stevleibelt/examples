#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-06-20
 * @see https://en.wikipedia.org/wiki/SIGHUP
 */

class Example
{
    private $items = array(
        1,2,3,4,5,6,7,8,9,0
    );
    private $processExecution = true;

    public function execute()
    {
        echo 'process id: ' . getmypid() . PHP_EOL;

        declare(ticks = 10);

        pcntl_signal(SIGHUP,    array($this, 'signalHandler'));    //controlling terminal is closed
        pcntl_signal(SIGINT,    array($this, 'signalHandler'));  //interrupt this processing | ctrl+c
        pcntl_signal(SIGUSR1,   array($this, 'signalHandler'));    //user defined conditions
        pcntl_signal(SIGUSR2,   array($this, 'signalHandler'));    //user defined conditions
        pcntl_signal(SIGQUIT,   array($this, 'signalHandler'));    //quit your processing
        pcntl_signal(SIGILL,    array($this, 'signalHandler'));    //illegal instruction performed
        pcntl_signal(SIGABRT,   array($this, 'signalHandler'));    //abort process
        pcntl_signal(SIGFPE,    array($this, 'signalHandler'));    //error on arithmetic
        pcntl_signal(SIGSEGV,   array($this, 'signalHandler'));    //invalid virtual memory reference
        pcntl_signal(SIGPIPE,   array($this, 'signalHandler'));    //write to a pipe without other process is connected to it
        pcntl_signal(SIGALRM,   array($this, 'signalHandler'));    //some kind of limit is reached
        pcntl_signal(SIGTERM,   array($this, 'signalHandler'));  //termination signal | kill <pid>
        pcntl_signal(SIGCHLD,   array($this, 'signalHandler'));    //child is terminated
        pcntl_signal(SIGCONT,   array($this, 'signalHandler'));    //continue your work
        pcntl_signal(SIGTSTP,   array($this, 'signalHandler'));    //terminal stop signal
        pcntl_signal(SIGTTIN,   array($this, 'signalHandler'));    //background process attempting read
        pcntl_signal(SIGTTOU,   array($this, 'signalHandler'));    //background process attempting write
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

    private function signalHandler($signal)
    {   
        echo 'cought signal: "' . $signal . '"' . PHP_EOL;
        $this->processExecution = false;
    }
}

$example = new Example();
$example->execute();
