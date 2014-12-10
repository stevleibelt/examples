<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10 
 */

/**
 * Class ConvertOdtToPdfCommand
 */
class ConvertOdtToPdfCommand extends Command
{
    /**
     * @param string $filePath
     * @return array
     * @throws InvalidArgumentException
     */
    public function convert($filePath)
    {
        if (file_exists($filePath)) {
            $command = '/usr/bin/soffice --headless --convert-to pdf ' . $filePath;

            return $this->execute($command);
        } else {
            throw new InvalidArgumentException(
                $filePath . ' is not a valid file path'
            );
        }
    }
} 