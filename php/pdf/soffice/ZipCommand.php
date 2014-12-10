<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-10 
 */

/**
 * Class ZipCommand
 * @see
 *  http://www.cyberciti.biz/tips/how-can-i-zipping-and-unzipping-files-under-linux.html
 */
class ZipCommand extends Command
{
    /**
     * @param string $archiveName
     * @param array $items
     * @return array
     */
    public function zip($archiveName, array $items)
    {
        $command = '/usr/bin/zip -r ' . $archiveName . ' ' . implode(' ' , $items);

        return $this->execute($command);
    }

    /**
     * @param string $pathToArchive
     * @param null|string $outputPath
     * @return array
     */
    public function unzip($pathToArchive, $outputPath = null)
    {
        if (!is_null($outputPath)) {
            $command = '/usr/bin/unzip ' . $pathToArchive . ' -d ' . $outputPath;
        } else {
            $command = '/usr/bin/unzip ' . $pathToArchive;
        }

        return $this->execute($command);
    }

    /**
     * @param string $pathToArchive
     * @return array
     */
    public function listContent($pathToArchive)
    {
        $command = '/usr/bin/unzip -l ' . $pathToArchive;

        return $this->execute($command);
    }
}