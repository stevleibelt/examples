<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-08-14
 */

class TimestampOfDateTime
{
    /** @var int */
    private $timestamp;

    /**
     * @param string $dateTime
     */
    public function __construct(
        $dateTime
    ) {
        $timestampOrFalse = strtotime($dateTime);

        if ($timestampOrFalse === false) {
            $message = 'Could not parse provided $dateTime >>' . $dateTime . '<<';

            throw new Exception($message);
        }

        $this->timestamp = $timestampOrFalse;
    }

    /**
     * @return int
     */
    public function __invoke()
    {
        return $this->timestamp;
    }

    /**
     * @return string
     */
    public function __tostring()
    {
        return (string) $this->timestamp;
    }
}

$listOfDateTime = [
    '1970-01-01',
    '2007/01/09',
    '06.10.1983',
    '17.04.2016 08:00',
    '17.04.2016 08:35',
    '23.01.2018 21:47:47',
    '23.01.2018 21:47:48',
    '23.01.2018 21:47:49'
];

foreach ($listOfDateTime as $dateTime) {
    $timestamp = new TimestampOfDateTime($dateTime);

    echo 'timestamp of date time >>' . $dateTime . '<< is ' . $timestamp() . ' (' . date('Y-m-d H:i:s', $timestamp()) . ')' . PHP_EOL;
}
