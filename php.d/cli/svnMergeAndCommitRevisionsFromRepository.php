<?php
/**
 * @author: stev leibelt <artodeto@bazzline.net>
 * @since: 2014-08-25
 */

require_once 'Input.php';
require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'string' . DIRECTORY_SEPARATOR . 'StringClass.php';

/**
 * Class SvnMergeAndCommitRevisionsFromRepository
 */
class SvnMergeAndCommitRevisionsFromRepository
{
    /**
     * @var string
     */
    private $basePath;

    /**
     * @var Input
     */
    private $input;

    /**
     * @var string
     */
    private $projectRootPath;

    /**
     * @var StringClass
     */
    private $string;

    /**
     * @var array
     */
    private $validRepositories;

    /**
     * @param string $basePath
     */
    public function setBasePath($basePath)
    {
        $this->basePath = (string) $basePath;
    }

    /**
     * @param \Input $input
     */
    public function setInput(Input $input)
    {
        $this->input = $input;
    }

    /**
     * @param string $projectRootPath
     * @throws Exception
     */
    public function setProjectRootPath($projectRootPath)
    {
        if (!is_dir($projectRootPath)) {
            throw new Exception(
                'invalid path provided' . PHP_EOL .
                '"' . $projectRootPath . '" is not a directory'
            );
        }

        $this->projectRootPath = $projectRootPath;
    }

    /**
     * @param StringClass $string
     */
    public function setString(StringClass $string)
    {
        $this->string = $string;
    }

    /**
     * @param array $validRepositories
     */
    public function setValidRepositories(array $validRepositories)
    {
        $this->validRepositories = $validRepositories;
    }

    /**
     * @param int $return
     * @param string $command
     * @throws \RuntimeException
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

    /**
     * @param string|int $revision
     * @param string $url
     * @return array
     * @throws Exception
     */
    private function fetchLogLines($revision, $url)
    {
        $lines = array();
        $return = null;

        $command = 'svn log -c ' . $revision . ' ' . $url;
        exec($command, $lines, $return);

        $this->validateExecuteReturn($return, $command);
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
    private function merge($revision, $url, $isDryRun = false)
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
    private function commit($message, $isDryRun = false)
    {
        $cleanedMessage = str_replace('"', ' ', $message);

        if (strlen($cleanedMessage) === 0) {
            throw new InvalidArgumentException(
                'no valid message provided' . PHP_EOL .
                'message: ' . $message . PHP_EOL .
                'cleaned message: ' . $cleanedMessage
            );
        }

        $command = 'svn commit -m "' . $cleanedMessage . '"';

        if ($isDryRun) {
            echo $command . PHP_EOL;
        } else {
            echo shell_exec($command) . PHP_EOL;
        }
    }

    /**
     * @return string
     */
    public function getUsage()
    {
        return 'Usage: ' . PHP_EOL .
            '    ' . basename(__FILE__) . ' repository="<' . implode('|', $this->validRepositories) . '>" revisions="<revision_number>[,<revision_number>]" [--dry-run]';
    }

    /**
     * @throws InvalidArgumentException
     */
    public function execute()
    {
        $currentWorkingDirectory = getcwd();

        //validation
        if (!$this->input->hasParameter('repository')) {
            throw new InvalidArgumentException(
                'no repository provided'
            );
        }

        if (!$this->input->hasParameter('revisions')) {
            throw new InvalidArgumentException(
                'no revision provided'
            );
        }

        $repository = $this->input->getParameterValue('repository');
        $isValidRepository = false;

        foreach ($this->validRepositories as $validRepository) {
            if ($this->string->startsWith($repository, $validRepository)) {
                $isValidRepository = true;
                break;
            }
        }

        if (!$isValidRepository) {
            throw new InvalidArgumentException(
                'invalid repository provided'
            );
        }

        $revisions = explode(',', $this->input->getParameterValue('revisions', ''));
        natsort($revisions);
        $isDryRun = $this->input->hasLongOption('dry-run');

        //merging
        $messages = array();
        $url = $this->basePath . $repository;
        chdir($this->projectRootPath);

        foreach ($revisions as $revision) {
            $lines = $this->fetchLogLines($revision, $url);

            $header = explode('|', $lines[1]);
            $author = trim($header[1]);
            $message = trim($lines[3]);
            $commitMessage = 'Merged ' . $revision . '(' . $author . ') from ' . $repository . ': ' . $message;

            $this->merge($revision, $url, $isDryRun);
            $this->commit($commitMessage, $isDryRun);
            $messages[] = $message;
        }
        chdir($currentWorkingDirectory);

        echo PHP_EOL;
        echo '================================' . PHP_EOL;
        echo 'Changes:' . PHP_EOL;
        foreach ($messages as $message) {
            echo '  * ' . $message . PHP_EOL;
        }
    }
}

try {
    $string = new StringClass();
    $input = new Input($string);
    $input->setArguments($argv);

    $process = new SvnMergeAndCommitRevisionsFromRepository();

    //@todo - start - adapt to your needs
    $process->setBasePath('https://svn.my-domain.net/');
    $process->setProjectRootPath(__DIR__);
    $process->setValidRepositories(array('trunk', 'branch', 'release'));
    //@todo - end - adapt to your needs
    $process->setInput($input);
    $process->setString($string);

    $process->execute();
    exit(0);
} catch (Exception $exception) {
    echo PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo 'error occurred' . PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo $exception->getMessage() . PHP_EOL;
    echo PHP_EOL;
    echo '----------------' . PHP_EOL;
    echo $process->getUsage() . PHP_EOL;
    exit(1);
}
