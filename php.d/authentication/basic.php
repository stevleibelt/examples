#!/usr/bin/env php
<?php

/**
 * @see 
 *  https://en.wikipedia.org/wiki/Basic_access_authentication
 *  http://www.unixpapa.com/auth/basic.html
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-13
 */

class Decoder
{
    /**
     * @param string $base64String
     * @return array
     */
    public function decode($base64String)
    {
        return $this->thirdStep(
            $this->secondStep(
                $this->firstStep(
                    $base64String
                )
            )
        );
    }

    /**
     * @param string $base64String
     * @return string
     */
    private function firstStep($base64String)
    {
        return base64_decode($base64String);
    }

    /**
     * @param string
     * @return array ([0] => username, [1] => password)
     */
    private function secondStep($stringFromFirstStep)
    {
        return explode(':', $stringFromFirstStep, 2);
    }

    /**
     * @param array $usernameAndPassword
     * @param string $separator
     * @return string
     */
    private function thirdStep(array $usernameAndPassword, $separator = ' ')
    {
        return $usernameAndPassword[0] . $separator . $usernameAndPassword[1];
    }
}

class Encoder
{
    /**
     * @param string $username
     * @param string $password
     * @return string
     */
    public function encode($username, $password)
    {
        return $this->thirdStep(
            $this->secondStep(
                $this->firstStep(
                    $username, $password
                )
            )
        );
    }

    /**
     * @param string $username
     * @param string $password
     * @return string
     */
    private function firstStep($username, $password)
    {
        return $username . ':' . $password;
    }

    /**
     * @param string $stringFromFirstStep
     * @return string
     */
    private function secondStep($stringFromFirstStep)
    {
        return base64_encode($stringFromFirstStep);
    }

    /**
     * @param string $stringFromSecondStep
     * @return string
     */
    private function thirdStep($stringFromSecondStep)
    {
        return 'Basic ' . $stringFromSecondStep;
    }
}

$options = getopt(
    'de',
    array(
        'decode',
        'encode'
    )
);

$decode = (isset($options['d']) || isset($options['decode']));
$encode = (isset($options['e']) || isset($options['encode']));

if ($decode && $encode) {
    echo 'you can not decode and encode at the same time' . PHP_EOL;
    exit (1);
} else if (!$decode && !$encode) {
    echo 'invalid arguments provided' . PHP_EOL;
    echo 'usage: ' . basename(__FILE__) . ' <-d|--decode> <base 64 string>' . PHP_EOL;
    echo 'or' . PHP_EOL;
    echo 'usage: ' . basename(__FILE__) . ' <-e|--encode> <username> <password>' . PHP_EOL;
    exit (1);
}

if ($decode) {
    if ($argc < 3) {
        echo 'usage: ' . basename(__FILE__) . ' <-d|--decode> <base 64 string>' . PHP_EOL;
        exit (1);
    }

    $base64String   = $argv[2];
    $decoder        = new Decoder();

    echo 'base 64 string: ' . $base64String . PHP_EOL;
    echo '----' . PHP_EOL;

    echo '<username> <password>' . PHP_EOL;
    echo $decoder->decode($base64String) . PHP_EOL;
}

if ($encode) {
    if ($argc < 4) {
        echo 'usage: ' . basename(__FILE__) . ' <-e|--encode> <username> <password>' . PHP_EOL;
        exit (1);
    }

    $encoder    = new Encoder();
    $password   = $argv[3];
    $username   = $argv[2];

    echo 'username: ' . $username . PHP_EOL;
    echo 'password: ' . $password . PHP_EOL;
    echo '----' . PHP_EOL;

    echo $encoder->encode($username, $password) . PHP_EOL;
    echo 'also valid' . PHP_EOL;
    echo 'https://' . $username . ':' . $password . '@foobar.org' . PHP_EOL;
}
