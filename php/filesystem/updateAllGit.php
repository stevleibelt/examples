<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-08
 */

try {
    $isCalledFromCommandLineInterface = (PHP_SAPI === 'cli');

    if (!$isCalledFromCommandLineInterface) {
        throw new Exception('this is a command line script only');
    }

    if ($argc != 2) {
        throw new Exception('Usage: ' . basename(__FILE__) . ' <path_to_start_searching_for_git_repositories>');
    }

    $basePath = $argv[1];

    if (!is_dir($basePath)) {
        throw new Exception('provided base path "' . $basePath . '" is not a directory');
    }

    if (!is_readable($basePath)) {
        throw new Exception('provided base path "' . $basePath . '" is not readable');
    }

    /**
    * @param string $basePath
    * @return array
    */
    function getDirectoryNames($basePath)
    {
        $names = array();

        if ($directoryHandle = opendir($basePath)) {
            $blacklistedDirectoryNames = array(
                '.',
                '..',
                '.svn',
                '.idea',
                'vendor'
            );
            while (false !== ($fileSystemIdentifier = readdir($directoryHandle))) {
                if (is_dir($basePath . DIRECTORY_SEPARATOR . $fileSystemIdentifier)) {
                    if (!in_array($fileSystemIdentifier, $blacklistedDirectoryNames)) {
                        $names[] = $fileSystemIdentifier;
                    }
                }
            }
            closedir($directoryHandle);
        }

        return $names;
    }

    /**
     * @param string $basePath
     */
    function executeGitPull($basePath)
    {
        $currentWorkingDirectory = getcwd();
        chdir($basePath);

        $handle = popen('git pull 2>&1', 'r');
        echo "'$handle'; " . gettype($handle) . "\n";
        $read = fread($handle, 2096);
        echo $read;
        pclose($handle);

        chdir($currentWorkingDirectory);
    }

    /**
     * @param string $basePath
     */
    function directoryWalker($basePath)
    {
    echo 'base path: ' . $basePath . PHP_EOL;
        $names = getDirectoryNames($basePath);

        if (in_array('.git', $names)) {
            executeGitPull($basePath);
        } else {
            foreach ($names as $name) {
                $path = $basePath . DIRECTORY_SEPARATOR . $name;
                directoryWalker($path);
            }
        }
    }

    directoryWalker($basePath);
} catch (Exception $exception) {
    echo $exception->getMessage() . PHP_EOL;
    exit(1);
}
