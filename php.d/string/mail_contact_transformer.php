<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-11-08
 */

class Contact
{
    /** @var string */
    private $address;

    /** @var string */
    private $name;

    /**
     * @param string $address
     * @param null|string $name
     */
    public function __construct($address, $name = null)
    {
        $this->address  = $address;
        $this->name     = $name;
    }

    /**
     * @return string
     */
    public function address()
    {
        return $this->address;
    }

    /**
     * @return boolean
     */
    public function hasName()
    {
        return (!is_null($this->name));
    }

    /**
     * @return null|string
     */
    public function name()
    {
        return $this->name;
    }

    public function __toString()
    {
        if ($this->hasName()){
        } else {
        }

        return (
            $this->hasName()
            ? $this->name() . ' <' . $this->address() . '>'
            : $this->address()
        );
    }
}

$testData = array(
    'arto deto <artodeto@bazzline.net>',
    '<artodeto@bazzline.net>',
    'artodeto@bazzline.net',
);

foreach ($testData as $string) {
    echo ":: test data: " . $string . PHP_EOL;

    $result = explode('<', $string, 2);

    //something like "foo@bar.ru" detected
    $containsOnlyAdressWithoutPointedBracket    = (
        (count($result) == 1)
        && (strlen($result[0]) > 0) //contains "foo@bar.ru"
    );
    //something like "<foo@bar.ru>" detected
    $containsOnlyAddressWithPointedBracket      = (
        (count($result) == 2)
        && (strlen($result[0]) === 0)   //contains ""
        && (strlen($result[1]) > 0)     //contains "foo@bar.ru>"
    );
    //something like "foo bar <foo@bar.ru>" detected
    $containsNameAndAddressWithPointedBracket   = (
        (count($result) == 2)
        && (strlen($result[0]) > 0) //contains "foo bar"
        && (strlen($result[1]) > 0) //contains "foo@bar.ru>"
    );

    if ($containsOnlyAdressWithoutPointedBracket) {
        $address    = trim($result[0]);
        $contact    = new Contact($result[0]);
    } else if ($containsOnlyAddressWithPointedBracket) {
        $address    = trim(substr($result[1], 0, -1));
        $contact    = new Contact($address);
    } else if ($containsNameAndAddressWithPointedBracket) {
        $address    = trim(substr($result[1], 0, -1));
        $name       = trim($result[0]);
        $contact    = new Contact($address, $name);
    } else {
        echo ":: Warning, unsupported format!" . PHP_EOL;
        var_dump($result);
    }

    if ($contact instanceof Contact) {
        echo ":: Contact as string: " . $contact;
    }

    echo PHP_EOL;
    echo PHP_EOL;
}
