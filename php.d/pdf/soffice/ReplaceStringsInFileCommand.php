<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-16 
 */

/**
 * Class ReplaceStringsInFileCommand
 */
class ReplaceStringsInFileCommand extends Command
{
    /**
     * @param string $path
     * @param array $searchAndReplace
     */
    public function replace($path, array $searchAndReplace)
    {
        $content = file_get_contents($path);
        $content = str_replace(array_keys($searchAndReplace), array_values($searchAndReplace), $content);
        file_put_contents($path, $content);
    }
} 