<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

namespace Net\Bazzline\Alice\Basic;

class User
{
    /** @var string */
    private $cv;

    /** @var string */
    private $email;

    /** @var string */
    private $name;

    /**
     * @return string
     */
    public function getCv()
    {
        return $this->cv;
    }

    /**
     * @param string $cv
     */
    public function setCv($cv)
    {
        $this->cv = (string) $cv;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = (string) $email;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = (string) $name;
    }
}
