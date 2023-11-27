<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-07
 */

class Foo
{
    public function dump()
    {
        echo 'public file: ' . $this->getPublicFile() . PHP_EOL;
        echo 'protected file: ' . $this->getProtectedFile() . PHP_EOL;
        echo 'private file: ' . $this->getPrivateFile() . PHP_EOL;
    }

    /**
     * @return string
     */
    public function getPublicFile()
    {
        return __FILE__;
    }

    /**
     * @return string
     */
    protected function getProtectedFile()
    {
        return __FILE__;
    }

    /**
     * @return string
     */
    private function getPrivateFile()
    {
        return __FILE__;
    }
}
