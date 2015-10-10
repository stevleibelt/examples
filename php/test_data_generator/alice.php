<?php

require_once __DIR__ . '/vendor/autoload.php';

class CompanyUser
{
    private $userName;
    private $fullName;
    private $birthDate;
    private $email;

    public function getUserName()
    {
        return $this->userName;
    }
    public function setUserName($userName)
    {
        $this->userName = $userName;
    }
    public function setFullName($fullName)
    {
        $this->fullName = $fullName;
    }
    public function setBirthDate($birthDate)
    {
        $this->birthDate = $birthDate;
    }
    public function setEmail($email)
    {
        $this->email = $email;
    }
    public function displayProperties()
    {
        echo 'user name: ' . $this->userName . PHP_EOL;
        echo 'full name: ' . $this->fullName . PHP_EOL;
        echo 'birth date: ' . $this->birthDate . PHP_EOL;
        echo 'email: ' . $this->email . PHP_EOL;
    }
}

class Company
{
    private $name;
    private $owner;
    private $members;
    private $createdAt;
    private $updatedAt;

    public function setName($name)
    {
        $this->name = $name;
    }
    public function setOwner($owner)
    {
        $this->owner = $owner;
    }
    public function addMember(CompanyUser $user)
    {
        $this->members[] = $user;
    }
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    }
    public function displayProperties()
    {
        $memberUserNames = array();
        foreach ($this->members as $member) {
            $memberUserNames[] = $member->getUserName();
        }
        echo 'name: ' . $this->name . PHP_EOL;
        echo 'owner: ' . $this->owner->getUserName() . PHP_EOL;
        echo 'members: ' . implode(', ', $memberUserNames) . PHP_EOL;
        echo 'created at: ' . $this->createdAt->format('Y-m-d H:i:s') . PHP_EOL;
        echo 'updated at: ' . $this->updatedAt->format('Y-m-d H:i:s') . PHP_EOL;
    }
}

$loader     = new \Nelmio\Alice\Fixtures\Loader();
$objects    = $loader->load(__DIR__ . '/alice_company.yml');

foreach ($objects as $object) {
    echo get_class($object) . PHP_EOL;
    $object->displayProperties();
    echo PHP_EOL;
}
