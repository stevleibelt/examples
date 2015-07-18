<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-22
 */

namespace Net\Bazzline\Alice\Basic;

class Team
{
    /** @var string */
    private $description = '';

    /** @var array */
    private $members = array();

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return array
     */
    public function getMembers()
    {
        return $this->members;
    }

    /**
     * @param User $user
     */
    public function addUser(User $User)
    {
        $this->members[] = $user;
    }
}
