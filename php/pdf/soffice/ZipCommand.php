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
     * @param string $path
     * @return array
     */
    public function zip($archiveName, $path)
    {
        $cwd = getcwd();
        $fullQualifiedArchivePath = realpath($cwd . DIRECTORY_SEPARATOR . $archiveName);
        chdir($path);
        $command = '/usr/bin/zip -r ' . $fullQualifiedArchivePath . ' *';
        $lines = $this->execute($command);
        chdir($cwd);

        return $lines;
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

    /**
     * @throws RuntimeException
     */
    public function validateEnvironment()
    {
        if (!is_executable('/usr/bin/unzip')) {
            throw new RuntimeException(
                '/usr/bin/unzip is mandatory'
            );
        }

        if (!is_executable('/usr/bin/zip')) {
            throw new RuntimeException(
                '/usr/bin/zip is mandatory'
            );
        }
    }
}