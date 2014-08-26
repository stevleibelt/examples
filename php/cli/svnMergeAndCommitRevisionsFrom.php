<?php
/**
 * @author: stev leibelt <artodeto@bazzline.net>
 * @since: 2014-08-25
 * @todo create classes out of it
 */

define('IS_DRY_RUN', true);

/**
 * taken from: https://github.com/stevleibelt/examples/blob/master/php/string/startsWith.php
 *
 * @param string $string
 * @param string $prefix
 * @return bool
 */
function stringStartsWith($string, $prefix)
{
    return (substr($string, 0, strlen($prefix)) === $prefix);
}

/**
 * @param int $return
 * @param string $command
 * @throws \RuntimeException
 */
function validateExecuteReturn($return, $command)
{
    if ($return > 0) {
        throw new RuntimeException(
            'following command created an error: "' . $command . '"' . PHP_EOL .
            'return: "' . $return . '"'
        );
    }
}

/**
 * @param string|int $revision
 * @param string $url
 * @return array
 * @throws Exception
 */
function svnFetchLogLines($revision, $url)
{
    $lines = array();
    $return = null;

    $command = 'svn log -c ' . $revision . ' ' . $url;
    exec($command, $lines, $return);

    validateExecuteReturn($return, $command);
    if (empty($lines)) {
        throw new RuntimeException(
            'no log entry found for revision ' . $revision
        );
    }

    return $lines;
}

/**
 * @param int|string $revision
 * @param string $url
 * @param bool $isDryRun
 */
function svnMerge($revision, $url, $isDryRun = false)
{
    $command = 'svn merge -c ' . $revision . ' ' . $url . ' .';

    if ($isDryRun) {
        echo $command . PHP_EOL;
    } else {
        echo shell_exec($command) . PHP_EOL;
    }
}

/**
 * @param $message
 * @param bool $isDryRun
 * @throws InvalidArgumentException
 */
function svnCommit($message, $isDryRun = false)
{
    $cleanedMessage = str_replace('"', ' ', $message);
    $command = 'svn commit -m="' . $cleanedMessage . '"';

    if (strlen($cleanedMessage) === 0) {
        throw new InvalidArgumentException(
            'no valid message provided' . PHP_EOL .
            'message: ' . $message . PHP_EOL .
            'cleaned message: ' . $cleanedMessage
        );
    }

    if ($isDryRun) {
        echo $command . PHP_EOL;
    } else {
        echo shell_exec($command) . PHP_EOL;
    }
}

try {
    $basePath = 'https://svn.my-domain.net/';   //@todo - adapt to your needs
    $currentWorkingDirectory = getcwd();
    $projectRoot = realpath(__DIR__);   //@todo - adapt to your needs
    $filePath = array_shift($argv);
    $source = array_shift($argv);
    $revisions = $argv;
    $repository = array_pop(explode('=', $source));
    $validRepositories = array('trunk', 'branch', 'release');   //@todo - adapt to your needs

    $usage = 'Usage: ' . PHP_EOL .
        '    ' . basename(__FILE__) . ' source="<trunk|branch/my_branch|release/1.2.3>" <revision_number> [<revision_number>]';   //@todo - adapt to your needs

    //validation
    if (strlen($source) === 0) {
        throw new InvalidArgumentException(
            'no source provided'
        );
    }

    $isValidRepository = false;
    foreach ($validRepositories as $validRepository) {
        if (stringStartsWith($repository, $validRepository)) {
            $isValidRepository = true;
            break;
        }
    }

    if (!$isValidRepository) {
        throw new InvalidArgumentException(
            'invalid source provided'
        );
    }

    if (empty($revisions)) {
        throw new InvalidArgumentException(
            'no revision provided'
        );
    }

    //merging
    $url = $basePath . $repository;
    $messages = array();
    chdir($projectRoot);

    foreach ($revisions as $revision) {
        $lines = svnFetchLogLines($revision, $url);

        $header = explode('|', $lines[1]);
        $author = trim($header[1]);
        $message = trim($lines[3]);

        svnMerge($revision, $url, IS_DRY_RUN);
        svnCommit($message, IS_DRY_RUN);
    }

    chdir($currentWorkingDirectory);
    exit(0);
} catch (Exception $exception) {
    echo PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo 'error occurred' . PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo $exception->getMessage() . PHP_EOL;
    echo PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo $usage . PHP_EOL;
    exit(1);
}
