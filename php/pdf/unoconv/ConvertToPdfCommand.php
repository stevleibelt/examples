<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10 
 */

/**
 * Class ConvertToPdfCommand
 */
class ConvertToPdfCommand extends Command
{
    /**
     * @param string $sourceFilePath
     * @param string $destinationFilePath
     * @return array
     * @throws InvalidArgumentException
     */
    public function convert($sourceFilePath, $destinationFilePath = null)
    {
        if (file_exists($sourceFilePath)) {
            if (!is_null($destinationFilePath)) {
                $command = '/usr/bin/unoconv -f pdf -o ' . $destinationFilePath . ' ' . $sourceFilePath;
            } else {
                $command = '/usr/bin/unoconv -f pdf ' . $sourceFilePath;
            }

            return $this->execute($command);
        } else {
            throw new InvalidArgumentException(
                $sourceFilePath . ' is not a valid file path'
            );
        }
    }

    /**
     * @throws RuntimeException
     */
    public function validateEnvironment()
    {
        if (!is_executable('/usr/bin/unoconv')) {
            throw new RuntimeException(
                '/usr/bin/unoconv is mandatory'
            );
        }
    }
} 