<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10
 */

/**
 * Class Command
 * @package Command
 */
class Command
{
    /**
     * @param string $command
     * @return array
     * @throws RuntimeException
     */
    public function __invoke($command)
    {
        return $this->execute($command);
    }

    /**
     * @param string $command
     * @return array
     * @throws RuntimeException
     * @todo add callback as parameter
     */
    public function execute($command)
    {
        $lines = array();
        $return = null;

        exec($command, $lines, $return);
        $this->validateExecuteReturn($return, $command);

        return $lines;
    }

    /**
     * @throws RuntimeException
     */
    public function validateEnvironment()
    {
    }

    /**
     * @param int $return
     * @param string $command
     * @throws RuntimeException
     */
    private function validateExecuteReturn($return, $command)
    {
        if ($return > 0) {
            throw new RuntimeException(
                'following command created an error: "' . $command . '"' . PHP_EOL .
                'return: "' . $return . '"'
            );
        }
    }
}