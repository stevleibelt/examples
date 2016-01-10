<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-10
 */

/**
 * @param string $haystack
 * @param string $needle
 * @return bool
 */
function stringEndsWith($haystack, $needle)
{
        return (substr($haystack, -(strlen($needle))) === $needle);
}

$path       = __DIR__ . '/..';
$iterator   = new RecursiveIteratorIterator(
    new RecursiveCallbackFilterIterator(
        new RecursiveDirectoryIterator(
            $path, 
            RecursiveDirectoryIterator::SKIP_DOTS
        ),
        function (
            SplFileInfo $current, 
            $key, 
            RecursiveDirectoryIterator $iterator
        ) {
            $isValid = (
                (
                    $iterator->isDir()
                    && $iterator->hasChildren()
                )
                || (
                    $current->isFile()
                    && stringEndsWith($current->getFilename(), '.php')
                )
            );

            return $isValid;
        }
    )
);

$stringLengthOfTheCurrentPath = strlen($path);

echo 'iterating recursivly through path: ' . PHP_EOL .  $path . PHP_EOL;

foreach ($iterator as $item) {
    echo '    ' . substr($item->getPathname(), $stringLengthOfTheCurrentPath) . PHP_EOL;
}
