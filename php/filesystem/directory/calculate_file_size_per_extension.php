<?php
/**
 * @author: stev leibelt <artodeto@bazzline.net>
 * @since: 2015-04-15
 */

$usage = basename(__FILE__) . ' <path to directory> <suffix one> [<suffix n>]' . PHP_EOL;

if ($argc < 3) {
    echo $usage;
    exit(1);
}

$arguments = $argv;
array_shift($arguments);    //we don't need the first argument
$path = array_shift($arguments);

if (!is_dir($path) || !is_readable($path)) {
    echo 'provided path "' . $path . '" is not a directory or not readable' . PHP_EOL;
    exit(1);
}

$iterator = new SuffixFilenameFilterIterator(new DirectoryIterator($path));
$iterator->setSuffixes($arguments);
$data = array();

foreach ($iterator as $item) {
    if ($item->isFile()) {
        $pathInformation = pathinfo($item->getRealPath());
        $extension = $pathInformation['extension'];
        if (isset($data[$extension])) {
            $data[$extension][] = $item->getSize();
        } else {
            $data[$extension] = array($item->getSize());
        }
    }
}

foreach ($data as $extension => $sizes) {
    $counter = 0;
    $totalSizeInBytes = 0;

    foreach ($sizes as $size) {
        ++$counter;
        $totalSizeInBytes += $size;
    }
    $averageSizeInBytes = ($totalSizeInBytes / $counter);

    echo $counter . ' files with extension "' . $extension . '" average size (in bytes) "' . $averageSizeInBytes . '", total size (in bytes) "' . $totalSizeInBytes . '"' . PHP_EOL;
}
echo PHP_EOL;

class SuffixFilenameFilterIterator extends FilterIterator
{
    /** @var array */
    private $suffixes = array();

    /**
     * @param array $suffixes
     */
    public function setSuffixes(array $suffixes)
    {
        $this->suffixes = $suffixes;
    }

    /**
     * @return bool
     */
    public function accept()
    {
        $accept = false;

        foreach ($this->suffixes as $suffix) {
            $endsWith = (substr($this->current(), -(strlen($suffix))) === $suffix);
            if ($endsWith) {
                $accept = true;
                break;
            }
        }

        return $accept;
    }
}
