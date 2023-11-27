#!/bin/env php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-01-19
 */

class Date
{
    /** @var int|string */
    private $day;

    /** @var int|string */
    private $month;

    /** @var int|string */
    private $year;

    public function __construct($day, $month, $year)
    {
        $this->day      = $day;
        $this->month    = $month;
        $this->year     = $year;
    }

    /**
     * @return int|string
     */
    public function day()
    {
        return $this->day;
    }

    /**
     * @return int|string
     */
    public function month()
    {
        return $this->month;
    }

    /**
     * @return int|string
     */
    public function year()
    {
        return $this->year;
    }

    /**
     * @return int
     */
    public function asTimeStamp()
    {
        return mktime(0, 0, 0, $this->month(), $this->day(), $this->year());
    }
}

$lastDayOfTheCurrentMonth = date('d', strtotime('last day of ' . date('M')));   //to much magic, I know

$firstDateOfTheMonth    = new Date('01', date('m'), date('Y'));
$lastDateOfTheMonth     = new Date($lastDayOfTheCurrentMonth, date('m'), date('Y'));

$firstCalendarWeek  = date('W', $firstDateOfTheMonth->asTimeStamp());
$lastCalendarWeek   = date('W', $lastDateOfTheMonth->asTimeStamp());

$lines = array(
    'first day of the current month as time stamp'  => $firstDateOfTheMonth->asTimeStamp(),
    'last day of the current month as time stamp'   => $lastDateOfTheMonth->asTimeStamp(),
    'first calendar week'                           => $firstCalendarWeek,
    'last calendar week'                            => $lastCalendarWeek
);

foreach ($lines as $header => $line) {
    echo $header . ': ' . $line . PHP_EOL;
}
